find_program(ZATHURA "zathura")

if(NOT ZATHURA)
  message(
    WARNING
      "recommended: zathura - vim-like runtime reloadable fast pdf viever not found\n"
      "Installation commands:\n"
      "\n"
      "  Fedora:    sudo dnf install zathura\n"
      "  Arch:      sudo pacman -S zathura\n"
      "  Ubuntu:    sudo apt install zathura\n"
      "  Debian:    sudo apt install zathura\n"
      "\n"
      "You may also need plugins for specific file formats:\n"
      "  PDF:       zathura-pdf-poppler or zathura-pdf-mupdf\n"
      "  DjVu:      zathura-djvu\n"
      "  PS:        zathura-ps\n"
      "  Comic:     zathura-cb\n"
      "\n"
      "Regenerate project after installation\n"
      "Note: Ensure zathura is in your PATH")
endif()
