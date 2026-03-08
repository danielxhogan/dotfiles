#!/bin/zsh
source ~/.zshrc

SRC="$HOME/programs/compiled/src"
INSTALL="$HOME/programs/compiled/install"

# get source repo
# ***************
# cd $SRC && \
# git clone https://code.videolan.org/videolan/x264.git

echo "\n\n \
  ************* \n \
  building x264 \n \
  ************* \n" && \
\
cd $SRC/x264 && \
git pull && \
./configure --prefix="$INSTALL" --bindir="$INSTALL/bin" --enable-static --enable-pic && \
make -j$(nproc) && \
make install
