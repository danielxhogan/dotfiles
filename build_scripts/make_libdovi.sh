#!/bin/zsh
source ~/.zshrc

SRC="$HOME/programs/compiled/src"
INSTALL="$HOME/programs/compiled/install"

# get source repo
# ***************
# cd $SRC && \
# git clone https://github.com/quietvoid/dovi_tool.git

# install dependency
# ******************
# cargo install cargo-c

echo "\n\n \
  ******************* \n \
  building libdovi \n \
  ******************* \n" && \
\
cd $SRC/dovi_tool && \
git pull && \
cargo build --release && \
cargo install --path . && \
cd ./dolby_vision && \
cargo cinstall --release --prefix="$INSTALL" --libdir="$INSTALL/lib"
