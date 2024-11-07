cd ~ && \
\
echo "\n\n \
  **************** \n \
  creating folders \n \
  **************** \n" && \
\
mkdir -p ~/ffmpeg/ffmpeg_sources ~/ffmpeg/bin && \
\
$HOME/dotfiles/make_ffmpeg/1_install_deps.sh && \
$HOME/dotfiles/make_ffmpeg/2_make_x264.sh && \
$HOME/dotfiles/make_ffmpeg/3_make_x265.sh && \
$HOME/dotfiles/make_ffmpeg/4_make_libvpx.sh && \
$HOME/dotfiles/make_ffmpeg/5_make_libaom.sh && \
$HOME/dotfiles/make_ffmpeg/6_make_libsvt_av1.sh && \
$HOME/dotfiles/make_ffmpeg/7_make_libdav1d.sh && \
$HOME/dotfiles/make_ffmpeg/8_make_libvmaf.sh && \
\
echo "\n\n \
  *************** \n \
  building ffmpeg \n \
  *************** \n" && \
\
cd ~/ffmpeg/ffmpeg_sources && \
wget -O ffmpeg-snapshot.tar.bz2 https://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2 && \
tar xjvf ffmpeg-snapshot.tar.bz2 && \
cd ffmpeg && \
PATH="$HOME/ffmpeg/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg/ffmpeg_build/lib/pkgconfig" ./configure \
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
  --enable-libvmaf && \
PATH="$HOME/ffmpeg/bin:$PATH" make -j$(nproc) && \
make install
