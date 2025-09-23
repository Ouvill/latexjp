FROM docker.io/ubuntu:24.04

RUN apt-get update && apt-get -y install \
  texlive-lang-japanese \
  texlive-latex-extra \
  texlive-luatex \
  texlive-extra-utils \
  latexmk \
  pandoc \
  fonts-ipaexfont \
  fonts-noto-cjk-extra \
  fonts-linuxlibertine \
  locales \
  # remove apt cache
  && rm -rf /var/lib/apt/lists/*

# Generate Japanese locale
RUN locale-gen ja_JP.UTF-8 && \
    update-locale LANG=ja_JP.UTF-8

# Set working directory
WORKDIR /workspace

# Set environment variables for better Japanese support
ENV LANG=ja_JP.UTF-8
ENV LC_ALL=ja_JP.UTF-8
