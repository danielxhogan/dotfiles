#!/bin/zsh
source ~/.zshrc

SRC="$HOME/programs/compiled/src"
INSTALL="$HOME/programs/compiled/install"

# get source repo
# ***************
# cd $SRC && \
# git clone https://chromium.googlesource.com/webm/libvpx.git

echo "\n\n \
  *************** \n \
  building libvpx \n \
  *************** \n" && \
\
cd "$SRC/libvpx" && \
git pull && \
./configure --prefix="$INSTALL" --disable-examples --disable-unit-tests --enable-vp9-highbitdepth --as=yasm && \
make -j$(nproc) && \
make install
