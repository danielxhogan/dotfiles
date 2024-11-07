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
make install
