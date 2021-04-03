#!/bin/bash

set -euox pipefail

sudo apt-get update -qq

# generic tools
sudo apt-get install -qq \
  make \
  vim \
  git \
  wget \
  curl \
  ncdu \
  patch \
  tree \
  zip \
  unzip \
  gzip \
  bzip2 \
  rsync \
  locales \
  tzdata

# dev environment tools
sudo apt-get install -qq \
  gcc \
  build-essential \
  tmux \
  python3 python3-dev python3-pip \
  sqlite3 \
  graphviz libgraphviz-dev \
  texlive texlive-xetex \
  pandoc \
  inkscape
