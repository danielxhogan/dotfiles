#!/bin/zsh
source ~/.zshrc

SRC="$HOME/programs/compiled/src"
INSTALL="$HOME/programs/compiled/install"

# get source repo
# ***************
# cd $SRC && \
# git clone https://aomedia.googlesource.com/aom

echo "\n\n \
  *************** \n \
  building libaom \n \
  *************** \n" && \
\
cd $SRC/aom && \
git pull && \
mkdir -p aom_build && \
cd aom_build && \
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$INSTALL" -DENABLE_TESTS=OFF -DENABLE_NASM=on .. && \
make -j$(nproc) && \
make install
