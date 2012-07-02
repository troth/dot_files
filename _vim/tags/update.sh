#!/bin/bash

CTAGS_ARGS="-R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++"

ctags ${CTAGS_ARGS} cpp_src && mv tags cpp

#ctags ${CTAGS_ARGS} /usr/include/GL/ && mv tags gl # for OpenGL
#ctags ${CTAGS_ARGS} /usr/include/SDL/ && mv tags sdl # for SDL
#ctags ${CTAGS_ARGS} /usr/include/qt4/ && mv tags qt4 # for QT4

