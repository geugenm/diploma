# set_target_properties is not working in this case! See use_latex
set(PDFLATEX_COMPILER lualatex)

add_latex_document(
    main.tex
    INPUTS
    04_analysis.tex
    task.tex
    00_abstract.tex
    bsu.cls
    05_ending.tex
    hyphenation.tex
    01_intro.tex
    03_polaris.tex
    02_satnogs.tex
    BIBFILES
    references.bib
    USE_BIBLATEX
    TARGET_NAME
    main
)

unset(PDFLATEX_COMPILER)

get_target_property(latex_document_target main NAME)

add_dependencies(
    ${latex_document_target}_pdf
    generate_mermaid_diagrams
    create_fonts_symlink
    create_img_symlink
)

if(ZATHURA)
    add_custom_target(
        zathura_view_${latex_document_target}_pdf
        COMMAND
            ${ZATHURA} ${CMAKE_CURRENT_BINARY_DIR}/${latex_document_target}.pdf
        DEPENDS ${latex_document_target}_pdf
        COMMENT
            "[zathura]: opening pdf '${CMAKE_CURRENT_BINARY_DIR}/${latex_document_target}.pdf'"
        VERBATIM
        USES_TERMINAL
    )
endif()

file(GLOB_RECURSE tex_files_to_format CONFIGURE_DEPENDS *.tex)
foreach(tex_file ${tex_files_to_format})
    add_test(
        NAME "latexindent -k '${tex_file}'"
        COMMAND ${CMAKE_COMMAND} -E env ${LATEXINDENT} -k ${tex_file}
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    )
endforeach()

set(extensions pdf log)
foreach(ext ${extensions})
    install(
        FILES ${CMAKE_CURRENT_BINARY_DIR}/${latex_document_target}.${ext}
        DESTINATION pdf
    )
endforeach()
