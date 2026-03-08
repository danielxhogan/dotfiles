#!/bin/zsh
source ~/.zshrc

SRC="$HOME/programs/compiled/src"
SCRIPTS="$HOME/programs/compiled/scripts"
INSTALL="$HOME/programs/compiled/install"

# get source repo
# ***************
cd $SRC && \
git clone https://code.ffmpeg.org/FFmpeg/FFmpeg.git

# echo "\n\n \
#   *************************** \n \
#   building ffmpeg dependecies \n \
#   *************************** \n" && \
# \
# $SCRIPTS/make_libplacebo.sh && \
# $SCRIPTS/make_x264.sh && \
# $SCRIPTS/make_x265.sh && \
# $SCRIPTS/make_libvpx.sh && \
# $SCRIPTS/make_libaom.sh && \
# $SCRIPTS/make_libsvt_av1.sh && \
# $SCRIPTS/make_libdav1d.sh && \
# $SCRIPTS/make_libvmaf.sh && \
# \
echo "\n\n \
  *************** \n \
  building ffmpeg \n \
  *************** \n" && \
\
cd "$SRC/FFmpeg" && \
git pull && \
./configure \
  --prefix="$INSTALL" \
  --pkg-config-flags="--static" \
  --extra-cflags="-I$INSTALL/include -I$VULKAN_SDK/include" \
  --extra-ldflags="-L$INSTALL/lib -L$VULKAN_SDK/lib" \
  --extra-libs="-lpthread -lm" \
  --ld="g++" \
  --bindir="$INSTALL/bin" \
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
make -j$(nproc) && \
make install
