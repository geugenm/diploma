find_program(MMDC_EXECUTABLE mmdc REQUIRED)
find_program(NODE_EXECUTABLE node REQUIRED)

find_program(CHROMIUM_EXECUTABLE NAMES chromium chromium-browser)
find_program(FIREFOX_EXECUTABLE NAMES firefox firefox-esr)
find_program(CHROME_EXECUTABLE NAMES google-chrome google-chrome-stable)

if(CHROMIUM_EXECUTABLE)
    set(mermaid_browser_executable ${CHROMIUM_EXECUTABLE})
    set(mermaid_browser_type "chrome")
elseif(CHROME_EXECUTABLE)
    set(mermaid_browser_executable ${CHROME_EXECUTABLE})
    set(mermaid_browser_type "chrome")
elseif(FIREFOX_EXECUTABLE)
    set(mermaid_browser_executable ${FIREFOX_EXECUTABLE})
    set(mermaid_browser_type "firefox")
else()
    message(
        FATAL_ERROR
        "[mermaid] No suitable browser found for Mermaid rendering. Please install chromium, chrome, or firefox."
    )
endif()

message(
    STATUS
    "[mermaid] using browser: ${mermaid_browser_executable} (type: ${mermaid_browser_type})"
)

file(GLOB mermaid_files CONFIGURE_DEPENDS *.mmd)

foreach(mermaid_file ${mermaid_files})
    get_filename_component(mermaid_name ${mermaid_file} NAME_WE)
    # TODO: make it a separate currect directory, now temp fix for overleaf ease
    set(mermaid_output_png ${CMAKE_CURRENT_LIST_DIR}/../img/${mermaid_name}.png)

    add_custom_command(
        OUTPUT ${mermaid_output_png}
        COMMAND
            ${CMAKE_COMMAND} -E env
            PUPPETEER_EXECUTABLE_PATH=${mermaid_browser_executable}
            PUPPETEER_PRODUCT=${mermaid_browser_type} ${MMDC_EXECUTABLE} -i
            ${mermaid_file} -o ${mermaid_output_png} -b transparent -p
            ${CMAKE_CURRENT_LIST_DIR}/puppeteer.json
        DEPENDS ${mermaid_file}
        COMMENT
            "[mermaid] compiling png: '${mermaid_file}' -> '${mermaid_output_png}'"
        VERBATIM
        USES_TERMINAL
    )

    list(APPEND mermaid_generated_pngs ${mermaid_output_png})
endforeach()

add_custom_target(
    generate_mermaid_diagrams
    ALL
    DEPENDS ${mermaid_generated_pngs}
)
