echo "\n\n \
  **************** \n \
  building libvmaf \n \
  **************** \n" && \
\
cd ~/ffmpeg/ffmpeg_sources && \
wget https://github.com/Netflix/vmaf/archive/v3.0.0.tar.gz && \
tar xvf v3.0.0.tar.gz && \
mkdir -p vmaf-3.0.0/libvmaf/build &&\
cd vmaf-3.0.0/libvmaf/build && \
meson setup -Denable_tests=false -Denable_docs=false --buildtype=release --default-library=static .. --prefix "$HOME/ffmpeg/ffmpeg_build" --bindir="$HOME/ffmpeg/ffmpeg_build/bin" --libdir="$HOME/ffmpeg/ffmpeg_build/lib" && \
ninja -j$(nproc) && \
ninja install
