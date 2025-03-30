find_program(MMDC_EXECUTABLE mmdc REQUIRED)
find_program(NODE_EXECUTABLE node REQUIRED)

file(GLOB CONFIGURE_DEPENDS MERMAID_FILES *.mmd)

find_program(CHROMIUM_EXECUTABLE NAMES chromium chromium-browser)
find_program(FIREFOX_EXECUTABLE NAMES firefox firefox-esr)
find_program(CHROME_EXECUTABLE NAMES google-chrome google-chrome-stable)

if(CHROMIUM_EXECUTABLE)
  set(BROWSER_EXECUTABLE ${CHROMIUM_EXECUTABLE})
  set(BROWSER_TYPE "chrome")
elseif(CHROME_EXECUTABLE)
  set(BROWSER_EXECUTABLE ${CHROME_EXECUTABLE})
  set(BROWSER_TYPE "chrome")
elseif(FIREFOX_EXECUTABLE)
  set(BROWSER_EXECUTABLE ${FIREFOX_EXECUTABLE})
  set(BROWSER_TYPE "firefox")
else()
  message(FATAL_ERROR "No suitable browser found for Mermaid rendering")
endif()

message(STATUS "Using browser: ${BROWSER_EXECUTABLE}")

foreach(MERMAID_FILE ${MERMAID_FILES})
  get_filename_component(MERMAID_NAME ${MERMAID_FILE} NAME_WE)
  set(OUTPUT_PNG ${CMAKE_CURRENT_BINARY_DIR}/${MERMAID_NAME}.png)

  add_custom_command(
    OUTPUT ${OUTPUT_PNG}
    COMMAND
      ${CMAKE_COMMAND} -E env PUPPETEER_EXECUTABLE_PATH=${BROWSER_EXECUTABLE}
      PUPPETEER_PRODUCT=${BROWSER_TYPE} ${MMDC_EXECUTABLE} -i ${MERMAID_FILE} -o
      ${OUTPUT_PNG} -b transparent
    DEPENDS ${MERMAID_FILE}
    COMMENT "Generating PNG from ${MERMAID_NAME}.mmd"
    VERBATIM USES_TERMINAL)

  list(APPEND GENERATED_PNGS ${OUTPUT_PNG})
endforeach()

add_custom_target(generate_mermaid_diagrams ALL DEPENDS ${GENERATED_PNGS})
