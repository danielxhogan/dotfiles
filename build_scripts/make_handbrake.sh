#!/bin/zsh
source ~/.zshrc

SRC="$HOME/programs/compiled/src"
INSTALL="$HOME/programs/compiled/install"

# get source repo
# ***************
# cd $SRC && \
# git clone https://github.com/danielxhogan/HandBrake.git

echo "\n\n \
  ****************** \n \
  building handbrake \n \
  ****************** \n" && \
\
cd $SRC/HandBrake && \
git fetch --all && \
git checkout master && \
git rebase upstream/master && \
./configure --launch-jobs=$(nproc) --launch --prefix $INSTALL --force && \
sudo make --directory=build install
