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
PATH="$HOME/ffmpeg/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg/ffmpeg_build/lib/pkgconfig:/usr/lib/x86_64-linux-gnu/pkgconfig" ./configure \
  --prefix="$HOME/ffmpeg/ffmpeg_build" \
  --pkg-config-flags="--static" \
  --extra-cflags="-I$HOME/ffmpeg/ffmpeg_build/include" \
  --extra-ldflags="-L$HOME/ffmpeg/ffmpeg_build/lib" \
  --extra-libs="-lpthread -lm" \
  --ld="g++" \
  --bindir="$HOME/ffmpeg/bin" \
  --enable-gpl \
  --enable-gnutls \
  --enable-libaom \
  --enable-libass \
  --enable-libfdk-aac \
  --enable-libfreetype \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-libsvtav1 \
  --enable-libdav1d \
  --enable-libvorbis \
  --enable-libvpx \
  --enable-libx264 \
  --enable-libx265 \
  --enable-nonfree \
  --enable-shared \
  --enable-libvmaf \
  --enable-libzimg && \
PATH="$HOME/ffmpeg/bin:$PATH" make -j$(nproc) && \
make install

# --enable-libv4l2 \
