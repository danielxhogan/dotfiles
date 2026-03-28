#!/bin/zsh
source ~/.zshrc

SRC="$HOME/programs/compiled/src"
INSTALL="$HOME/programs/compiled/install"

# get source repo
# ***************
cd $SRC && \
git clone https://gitlab.freedesktop.org/pipewire/pipewire.git

echo "\n\n \
  ******************* \n \
  building libplacebo \n \
  ******************* \n" && \
\
cd $SRC/pipewire && \
git pull && \
meson setup build && \
meson configure build -Dprefix=$INSTALL --libdir="$INSTALL/lib" && \
meson compile -C build && \
meson install -C build
