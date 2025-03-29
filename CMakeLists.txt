cmake_minimum_required(VERSION 3.21.0)
project(
  MyDocument
  VERSION 1.0.0
  DESCRIPTION "Professional LaTeX document"
  HOMEPAGE_URL "https://example.com")

# https://gitlab.kitware.com/cmake/community/-/wikis/contrib/modules/UseLATEX?version_id=19e293ada5929d3a8d337c5351fb733cba542322
include(cmake/UseLATEX.cmake)

set(PDFLATEX_COMPILER lualatex)

file(GLOB TTF_FILES CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/fonts/*.ttf")
file(COPY ${TTF_FILES} DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/fonts)

add_latex_document(
  src/main.tex
  INPUTS
  src/bsu.cls
  BIBFILES
  src/references.bib
  INCLUDE_DIRECTORIES
  src
  IMAGE_DIRS
  img
  USE_INDEX)
