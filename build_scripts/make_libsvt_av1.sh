#!/bin/zsh
source ~/.zshrc

SRC="$HOME/programs/compiled/src"
INSTALL="$HOME/programs/compiled/install"

# get source repo
# ***************
# cd $SRC && \
# git clone https://gitlab.com/AOMediaCodec/SVT-AV1.git

echo "\n\n \
  ******************* \n \
  building libsvt_av1 \n \
  ******************* \n" && \
\
cd "$SRC/SVT-AV1" && \
git pull && \
mkdir -p build && \
cd build && \
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$INSTALL" -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF .. && \
make -j$(nproc) && \
make install
