cd ~ && \
\
echo "\n\n \
  *********************** \n \
  installing dependencies \n \
  *********************** \n" && \
\
sudo apt-get update -qq && sudo apt-get -y install \
  autoconf \
  automake \
  build-essential \
  cmake \
  git-core \
  libass-dev \
  libfreetype6-dev \
  libgnutls28-dev \
  libmp3lame-dev \
  libsdl2-dev \
  libtool \
  libva-dev \
  libvdpau-dev \
  libopus-dev \
  libvorbis-dev \
  libxcb1-dev \
  libxcb-shm0-dev \
  libxcb-xfixes0-dev \
  meson \
  ninja-build \
  pkg-config \
  texinfo \
  wget \
  yasm \
  zlib1g-dev \
  v4l-utils \
  nasm \
  libnuma-dev \
  libunistring-dev \
  python3-pip && \
\
pip3 install --user meson && \
\
echo "\n\n \
  **************** \n \
  creating folders \n \
  **************** \n" && \
\
mkdir -p ~/ffmpeg/ffmpeg_sources ~/ffmpeg/bin && \
\
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
make install && \
\
echo "\n\n \
  ************* \n \
  building x265 \n \
  ************* \n" && \
\
cd ~/ffmpeg/ffmpeg_sources && \
wget -O x265.tar.bz2 https://bitbucket.org/multicoreware/x265_git/get/master.tar.bz2 && \
tar xjvf x265.tar.bz2 && \
cd multicoreware*/build/linux && \
PATH="$HOME/ffmpeg/bin:$PATH" cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$HOME/ffmpeg/ffmpeg_build" -DENABLE_SHARED=on DHIGH_BIT_DEPTH=on ../../source && \
PATH="$HOME/ffmpeg/bin:$PATH" make -j$(nproc) && \
make install && \
\
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
make install && \
\
echo "\n\n \
  ******************* \n \
  building libfdk_aac \n \
  ******************* \n" && \
\
cd ~/ffmpeg/ffmpeg_sources && \
git -C fdk-aac pull 2> /dev/null || git clone --depth 1 https://github.com/mstorsjo/fdk-aac && \
cd fdk-aac && \
autoreconf -fiv && \
./configure --prefix="$HOME/ffmpeg/ffmpeg_build" --disable-shared && \
make -j$(nproc) && \
make install && \
\
echo "\n\n \
  *************** \n \
  building libaom \n \
  *************** \n" && \
\
cd ~/ffmpeg/ffmpeg_sources && \
git -C aom pull 2> /dev/null || git clone --depth 1 https://aomedia.googlesource.com/aom && \
mkdir -p aom_build && \
cd aom_build && \
PATH="$HOME/ffmpeg/bin:$PATH" cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$HOME/ffmpeg/ffmpeg_build" -DENABLE_TESTS=OFF -DENABLE_NASM=on ../aom && \
PATH="$HOME/ffmpeg/bin:$PATH" make -j$(nproc) && \
make install && \
\
echo "\n\n \
  ******************* \n \
  building libsvt_av1 \n \
  ******************* \n" && \
\
cd ~/ffmpeg/ffmpeg_sources && \
git -C SVT-AV1 pull 2> /dev/null || git clone https://gitlab.com/AOMediaCodec/SVT-AV1.git && \
mkdir -p SVT-AV1/build && \
cd SVT-AV1/build && \
PATH="$HOME/ffmpeg/bin:$PATH" cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$HOME/ffmpeg/ffmpeg_build" -DCMAKE_BUILD_TYPE=Release -DBUILD_DEC=OFF -DBUILD_SHARED_LIBS=ON .. && \
PATH="$HOME/ffmpeg/bin:$PATH" make -j$(nproc) && \
make install && \
\
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
ninja install && \
\
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
ninja install && \
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
  --enable-libvmaf && \
PATH="$HOME/ffmpeg/bin:$PATH" make -j$(nproc) && \
make install

# --enable-shared && \
# --enable-libv4l2 \
