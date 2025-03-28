# LuaTeX Project Setup and Compilation Guide

[![GitHub Issues](https://img.shields.io/github/issues/geugenm/diploma?style=for-the-badge&color=171b20&labelColor=171b20)](https://github.com/geugenm/diploma/issues)
[![CMake](https://img.shields.io/badge/cmake-3.25+-171b20?style=for-the-badge&logo=cmake&logoColor=38bdae&labelColor=171b20)](https://cmake.org/download/)
[![LuaLaTeX](https://img.shields.io/badge/LuaLaTeX-ready-171b20?style=for-the-badge&logo=latex&logoColor=38bdae&labelColor=171b20)](https://www.latex-project.org/)
[![License](https://img.shields.io/badge/license-GPL-171b20?style=for-the-badge&labelColor=171b20&color=171b20)](license.md)

[![Open in Overleaf](https://img.shields.io/badge/Open_in-Overleaf-171b20?style=for-the-badge&logo=overleaf&logoColor=38bdae&labelColor=171b20)](https://www.overleaf.com/docs?snip_uri=https://github.com/geugenm/diploma/archive/refs/heads/master.zip)
[![Emacs](https://img.shields.io/badge/Emacs-compatible-171b20?style=for-the-badge&logo=gnuemacs&logoColor=38bdae&labelColor=171b20)](https://www.gnu.org/software/emacs/)
[![Neovim](https://img.shields.io/badge/Neovim-ready-171b20?style=for-the-badge&logo=neovim&logoColor=38bdae&labelColor=171b20)](https://neovim.io/)

This document provides a comprehensive guide to setting up a LaTeX environment
using LuaTeX for efficient document editing and typesetting. We will explore
four popular editor options: Emacs with AUCTeX, lazynvim with vimtex, overleaf
and Kile.

## 1. Installing a TeX Distribution

Choose a TeX distribution that aligns with your operating system:

**Linux:**

- **TeX Live (Recommended):** Offers an extensive package collection and regular updates.

  ```bash
  sudo dnf install texlive-full
  ```

- **Other Distributions:** Explore options like TeXstudio or proTeXt based on your preferences.

**Windows:**

- **MiKTeX:** Popular choice with on-the-fly package installation. Download from <https://miktex.org/download>.

**macOS:**

- **MacTeX:** A complete TeX distribution tailored for macOS. Download from <https://tug.org/mactex/>.

## 2. Essential LaTeX Packages

The list of required packages is listed in LaTeX document, also you can use `make` to get erros about required packages. Install packages using your TeX distribution's package manager (e.g., `tlmgr` for TeX Live).

To search for some missing packages use:

```sh
tlmgr search --file mathrsfs.sty --global
```

To install on fedora just add prefix `texlive-`:

```sh
sudo dnf install texlive-some-example-package
```

## 3. Editor Configuration

**Doom Emacs:**

1. **Install LaTeX:** Refer to the Emacs package manager or official instructions (<https://docs.doomemacs.org/v21.12/modules/lang/latex/>).
2. **(Optional) Install pdf-tools:** Enhance PDF interaction within Emacs.

**Kile:**

1. **Install Kile:** Use your system's package manager or download from <https://kile.org/>.
2. **Kile Features:** Enjoy a user-friendly interface with project management, syntax highlighting, code completion, and integrated PDF viewing.

## 4. Compilation and Workflow

- **Compile:** Use the appropriate command or keybinding (e.g., `lualatex` for LuaLaTeX output).
- **Automate:** Configure your editor to automatically build and view the generated PDF.
- **Optimize:** Utilize editor features and installed packages to streamline your LaTeX workflow.

## 5. Additional Resources

- **Comprehensive TeX documentation:** <https://www.tug.org/texlive/doc.html>
- **LaTeX community forums and support:** <https://tex.stackexchange.com/>
- **Package documentation and examples:** Refer to package websites or CTAN (<https://ctan.org/>).

## 6. Running

Just use:

```bash
sudo dnf install texlive-full
cmake --preset=release .
cmake --build build/release --config release
```

## 7. Advanced Techniques with Latexmk

**Latexmk** is a powerful tool for automating LaTeX compilation. It can watch
for changes in your files and automatically recompile your document, ensuring
that the PDF output is always up-to-date. Here's how to use it:

1. **Installation:** Install latexmk using your system's package manager.
2. **Basic Usage:** Navigate to your LaTeX project directory in the terminal and run `latexmk -pdf yourfile.tex`. This will compile your document and generate a PDF file.
3. **Customization:** Create a `.latexmkrc` file in your project directory to customize latexmk's behavior. You can specify options like the compiler to use, the output format, and the number of compilation runs.
4. **Continuous Compilation:** Use the `-pvc` option to enable continuous compilation. Latexmk will watch for changes in your files and automatically recompile your document.

**Here are some additional-advanced techniques you can use with latexmk:**

- **Specifying Dependencies:** Use the `$dependency` variable to specify dependencies between files.
- **Running External Tools:** Use the `$postprocess` variable to run external tools after compilation, such as BibTeX or MakeIndex.
- **Using Custom Build Rules:** Define custom build rules to handle specific file types or compilation steps.

**By mastering latexmk, you can significantly improve your LaTeX workflow and make the compilation process more efficient.**
