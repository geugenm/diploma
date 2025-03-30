# set_target_properties is not working in this case! See use_latex
set(PDFLATEX_COMPILER lualatex)

add_latex_document(
  main.tex
  INPUTS
  bsu.cls
  intro.tex
  satnogs_overview.tex
  polaris_overview.tex
  BIBFILES
  references.bib
  USE_BIBLATEX
  TARGET_NAME
  main)

unset(PDFLATEX_COMPILER)

get_target_property(TARGET_NAME main NAME)

if(ZATHURA)
  add_custom_target(
    zathura_view_${TARGET_NAME}_pdf
    COMMAND ${ZATHURA} ${CMAKE_CURRENT_BINARY_DIR}/${TARGET_NAME}.pdf
    DEPENDS ${TARGET_NAME}_pdf
    COMMENT
      "[zathura]: opening pdf ${CMAKE_CURRENT_BINARY_DIR}/${TARGET_NAME}.pdf"
    VERBATIM USES_TERMINAL)
endif()

add_dependencies(${TARGET_NAME}_pdf generate_mermaid_diagrams
                 create_fonts_symlink create_img_symlink)
