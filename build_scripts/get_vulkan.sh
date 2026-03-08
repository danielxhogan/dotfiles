#!/bin/zsh
source ~/.zshrc

PREBUILT="$HOME/programs/prebuilt"

echo "\n\n \
  **************** \n \
  getting vulkan \n \
  **************** \n" && \
\
cd $PREBUILT && \
mkdir vulkan && \
cd vulkan && \
wget https://sdk.lunarg.com/sdk/download/$VULKAN_VERSION/linux/vulkansdk-linux-x86_64-$VULKAN_VERSION.tar.xz && \
tar -xf vulkansdk-linux-x86_64-$VULKAN_VERSION.tar.xz && \
rm vulkansdk-linux-x86_64-$VULKAN_VERSION.tar.xz
