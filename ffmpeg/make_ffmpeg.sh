#!/bin/zsh
source ~/.zshrc

echo "\n\n \
  *************** \n \
  building ffmpeg \n \
  *************** \n" && \
\
cd ~/ffmpeg/ffmpeg_sources && \
wget -O ffmpeg-snapshot.tar.bz2 https://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2 && \
tar xjvf ffmpeg-snapshot.tar.bz2 && \
cd ffmpeg && \
PATH="$HOME/ffmpeg/bin:$PATH" ./configure \
  --prefix="$HOME/ffmpeg/ffmpeg_build" \
  --pkg-config-flags="--static" \
  --extra-cflags="-I$HOME/ffmpeg/ffmpeg_build/include -I$VULKAN_SDK/include" \
  --extra-ldflags="-L$HOME/ffmpeg/ffmpeg_build/lib -L$VULKAN_SDK/lib" \
  --extra-libs="-lpthread -lm" \
  --ld="g++" \
  --bindir="$HOME/ffmpeg/bin" \
  --enable-gpl \
  --enable-nonfree \
  --enable-shared \
  --enable-gnutls \
  --enable-libmp3lame \
  --enable-libfdk-aac \
  --enable-libvorbis \
  --enable-libopus \
  --enable-libx264 \
  --enable-libx265 \
  --enable-libvpx \
  --enable-libaom \
  --enable-libsvtav1 \
  --enable-libdav1d \
  --enable-libass \
  --enable-libfreetype \
  --enable-libvmaf \
  --enable-vulkan \
  --enable-libplacebo \
  --enable-libzimg && \
PATH="$HOME/ffmpeg/bin:$PATH" make -j$(nproc) && \
make install
