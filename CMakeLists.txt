cmake_minimum_required(VERSION 3.21.0)
project(
    diploma
    VERSION 1.0.0
    DESCRIPTION "Dedicated research page"
    HOMEPAGE_URL "https://github.com/geugenm/diploma/tree/main"
    LANGUAGES NONE)

include(CPack)

find_package(LATEX REQUIRED COMPONENTS LUALATEX PDFLATEX BIBER)

list(APPEND CMAKE_PREFIX_PATH cmake)
# https://gitlab.kitware.com/cmake/community/-/wikis/contrib/modules/UseLATEX?version_id=19e293ada5929d3a8d337c5351fb733cba542322
find_package(use_latex REQUIRED)

list(APPEND CMAKE_PREFIX_PATH cmake/recommended)

find_package(zathura REQUIRED)

add_custom_target(
    create_fonts_symlink ALL
    COMMAND
        ${CMAKE_COMMAND} -E create_symlink "${CMAKE_CURRENT_LIST_DIR}/fonts"
        "${CMAKE_CURRENT_BINARY_DIR}/fonts"
    COMMENT "[${PROJECT_NAME}] Creating symbolic link for fonts directory")

add_custom_target(
    create_img_symlink ALL
    COMMAND
        ${CMAKE_COMMAND} -E create_symlink "${CMAKE_CURRENT_LIST_DIR}/img"
        "${CMAKE_CURRENT_BINARY_DIR}/img"
    COMMENT "[${PROJECT_NAME}] Creating symbolic link for img directory")

add_subdirectory(mermaid)
add_subdirectory(src)
