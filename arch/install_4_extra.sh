#!/bin/bash

sudo pacman -S \
    zsh \
    zsh-completions \
    go \
    rust \
    clang \
    gvim \
    firefox \
    mpv \
    ffmpeg \
    neofetch \
    lsb-release \
    jre-openjdk \
    jdk-openjdk \
    gdb \
    nasm \
    meson \
    ninja \
    cmake \
    mercurial \
    wget \
    openssh \
    gnu-free-fonts \
    noto-fonts-extra \
    ttf-bitstream-vera \
    ttf-croscore \
    ttf-dejavu \
    ttf-hack \
    ttf-anonymous-pro \
    ttf-cascadia-code \
    ttf-droid \
    ttf-fantasque-sans-mono \
    ttf-fira-code \
    ttf-fira-mono \
    ttf-fira-sans \
    ttf-inconsolata \
    ttf-indic-otf \
    ttf-liberation \
    ttf-linux-libertine \
    ttf-roboto \
    ttf-roboto-mono \
    ttf-ubuntu-font-family \
    --noconfirm --needed

cat ../common/_vimrc >> ~/.vimrc
cat ../common/_bashrc >> ~/.bashrc

