#!/bin/zsh
source ~/.zshrc

$HOME/dotfiles/ffmpeg/make_folders.sh && \
$HOME/dotfiles/ffmpeg/install_deps.sh && \
$HOME/dotfiles/ffmpeg/make_x264.sh && \
$HOME/dotfiles/ffmpeg/make_x265.sh && \
$HOME/dotfiles/ffmpeg/make_libvpx.sh && \
$HOME/dotfiles/ffmpeg/make_libaom.sh && \
$HOME/dotfiles/ffmpeg/make_libsvt_av1.sh && \
$HOME/dotfiles/ffmpeg/make_libdav1d.sh && \
$HOME/dotfiles/ffmpeg/make_libvmaf.sh && \
$HOME/dotfiles/ffmpeg/make_ffmpeg.sh
