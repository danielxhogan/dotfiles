#!/bin/zsh
source ~/.zshrc

SRC="$HOME/programs/compiled/src"
INSTALL="$HOME/programs/compiled/install"

# get source repo
# ***************
cd $SRC && \
git clone https://github.com/danielxhogan/mpv.git && \
cd mpv && \
git remote add upstream https://github.com/mpv-player/mpv.git

# install dependencies
# ********************
# ./make_libplacebo
# ./make_ffmpeg

echo "\n\n \
  ************ \n \
  building mpv \n \
  ************ \n" && \
\
cd $SRC/mpv && \
git fetch --all && \
git checkout master && \
git rebase upstream/master && \
mkdir -p build && \
cd build && \
meson setup .. --prefix "$INSTALL" --libdir="$INSTALL/lib" && \
meson compile && \
meson install
