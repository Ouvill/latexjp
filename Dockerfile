FROM docker.io/ubuntu:24.04

RUN apt-get update && apt-get -y install texlive-lang-japanese texlive-latex-extra texlive-luatex texlive-extra-utils latexmk pandoc \
  fonts-ipaexfont \
  fonts-noto-cjk-extra \
  fonts-linuxlibertine \
#   remove apt cache
  && rm -rf /var/lib/apt/lists/*
