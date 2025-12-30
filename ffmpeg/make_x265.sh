#!/bin/zsh
source ~/.zshrc

echo "\n\n \
  ************* \n \
  building x265 \n \
  ************* \n" && \
\
cd ~/ffmpeg/ffmpeg_sources && \
wget -O x265.tar.bz2 https://bitbucket.org/multicoreware/x265_git/get/master.tar.bz2 && \
tar xjvf x265.tar.bz2 && \
cd multicoreware*/build/linux && \
mkdir -p 8bit 10bit 12bit && \
cd 12bit && \
PATH="$HOME/ffmpeg/bin:$PATH" cmake -G "Unix Makefiles" \
  -DCMAKE_INSTALL_PREFIX="$HOME/ffmpeg/ffmpeg_build" \
  -DHIGH_BIT_DEPTH=ON -DEXPORT_C_API=OFF -DENABLE_SHARED=OFF -DENABLE_CLI=OFF -DMAIN12=ON \
   ../../../source && \
PATH="$HOME/ffmpeg/bin:$PATH" make -j$(nproc) && \
cd ../10bit && \
PATH="$HOME/ffmpeg/bin:$PATH" cmake -G "Unix Makefiles" \
  -DCMAKE_INSTALL_PREFIX="$HOME/ffmpeg/ffmpeg_build" \
  -DHIGH_BIT_DEPTH=ON -DEXPORT_C_API=OFF -DENABLE_SHARED=OFF -DENABLE_CLI=OFF \
   ../../../source && \
PATH="$HOME/ffmpeg/bin:$PATH" make -j$(nproc) && \
cd ../8bit && \
ln -sf ../10bit/libx265.a libx265_main10.a && \
ln -sf ../12bit/libx265.a libx265_main12.a && \
PATH="$HOME/ffmpeg/bin:$PATH" cmake -G "Unix Makefiles" \
  -DCMAKE_INSTALL_PREFIX="$HOME/ffmpeg/ffmpeg_build" \
  -DEXTRA_LIB="x265_main10.a;x265_main12.a" -DEXTRA_LINK_FLAGS=-L. \
  -DLINKED_10BIT=ON -DLINKED_12BIT=ON \
   ../../../source && \
PATH="$HOME/ffmpeg/bin:$PATH" make -j$(nproc) && \
mv libx265.a libx265_main.a && \
ar -M <<EOF
CREATE libx265.a
ADDLIB libx265_main.a
ADDLIB libx265_main10.a
ADDLIB libx265_main12.a
SAVE
END
EOF

make install
