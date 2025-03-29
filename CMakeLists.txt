cmake_minimum_required(VERSION 3.21.0)
project(
  MyDocument
  VERSION 1.0.0
  DESCRIPTION "Professional LaTeX document"
  HOMEPAGE_URL "https://example.com")

list(APPEND CMAKE_PREFIX_PATH cmake)

# https://gitlab.kitware.com/cmake/community/-/wikis/contrib/modules/UseLATEX?version_id=19e293ada5929d3a8d337c5351fb733cba542322
find_package(use_latex REQUIRED)

find_package(LATEX REQUIRED COMPONENTS LUALATEX PDFLATEX BIBER)

list(APPEND CMAKE_PREFIX_PATH cmake/recommended)
find_package(zathura REQUIRED)

set(PDFLATEX_COMPILER lualatex)
set(LATEX_COMPILER lualatex)

add_latex_document(
  src/main.tex
  INPUTS
  src/bsu.cls
  src/intro.tex
  src/satnogs_overview.tex
  BIBFILES
  src/references.bib
  USE_BIBLATEX)

set_target_properties(main_pdf PROPERTIES LATEX_COMPILER_FLAGS "-halt-on-error")

file(CREATE_LINK "${CMAKE_CURRENT_LIST_DIR}/fonts"
     "${CMAKE_CURRENT_BINARY_DIR}/fonts" SYMBOLIC)

file(CREATE_LINK "${CMAKE_CURRENT_LIST_DIR}/img"
     "${CMAKE_CURRENT_BINARY_DIR}/img" SYMBOLIC)

if(ZATHURA)
  add_custom_target(
    view_pdf
    COMMAND ${ZATHURA} ${CMAKE_CURRENT_BINARY_DIR}/main.pdf
    DEPENDS main_pdf
    COMMENT "Opening PDF with Zathura"
    VERBATIM USES_TERMINAL)
endif()
