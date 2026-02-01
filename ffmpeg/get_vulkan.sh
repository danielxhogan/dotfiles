#!/bin/zsh
source ~/.zshrc

echo "\n\n \
  **************** \n \
  getting vulkan \n \
  **************** \n" && \
\
cd ~/ffmpeg/vulkan && \
wget https://sdk.lunarg.com/sdk/download/$VULKAN_VERSION/linux/vulkansdk-linux-x86_64-$VULKAN_VERSION.tar.xz && \
tar -xf vulkansdk-linux-x86_64-$VULKAN_VERSION.tar.xz
