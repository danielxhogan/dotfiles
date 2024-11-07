echo "\n\n \
  *************** \n \
  building libvpx \n \
  *************** \n" && \
\
cd ~/ffmpeg/ffmpeg_sources && \
git -C libvpx pull 2> /dev/null || git clone --depth 1 https://chromium.googlesource.com/webm/libvpx.git && \
cd libvpx && \
PATH="$HOME/ffmpeg/bin:$PATH" ./configure --prefix="$HOME/ffmpeg/ffmpeg_build" --disable-examples --disable-unit-tests --enable-vp9-highbitdepth --as=yasm && \
PATH="$HOME/ffmpeg/bin:$PATH" make -j$(nproc) && \
make install
