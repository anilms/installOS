#!/bin/bash

sudo pacman -S \
    go \
    gvim \
    firefox \
    ttf-fira-code \
    mplayer \
    ffmpeg \
    neofetch \
    jre-openjdk \
    jdk-openjdk \
    gdb \
    nasm \
    cmake \
    mercurial \
    wget \
    --noconfirm --needed

cat ../common/_vimrc >> ~/.vimrc
cat ../common/_bashrc >> ~/.bashrc

