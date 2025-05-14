#!/bin/zsh
source ~/.zshrc

echo "\n\n \
  ************* \n \
  building x264 \n \
  ************* \n" && \
\
cd ~/ffmpeg/ffmpeg_sources && \
git -C x264 pull 2> /dev/null || git clone --depth 1 https://code.videolan.org/videolan/x264.git && \
cd x264 && \
PATH="$HOME/ffmpeg/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg/ffmpeg_build/lib/pkgconfig" ./configure --prefix="$HOME/ffmpeg/ffmpeg_build" --bindir="$HOME/ffmpeg/bin" --enable-static --enable-pic && \
PATH="$HOME/ffmpeg/bin:$PATH" make -j$(nproc) && \
make install
