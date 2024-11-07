echo "\n\n \
  ***************** \n \
  building libdav1d \n \
  ***************** \n" && \
\
cd ~/ffmpeg/ffmpeg_sources && \
git -C dav1d pull 2> /dev/null || git clone --depth 1 https://code.videolan.org/videolan/dav1d.git && \
mkdir -p dav1d/build && \
cd dav1d/build && \
meson setup -Denable_tools=false -Denable_tests=false --default-library=static .. --prefix "$HOME/ffmpeg/ffmpeg_build" --libdir="$HOME/ffmpeg/ffmpeg_build/lib" && \
ninja -j$(nproc) && \
ninja install
