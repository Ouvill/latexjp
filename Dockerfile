FROM ubuntu:16.04
MAINTAINER Ouvill
RUN apt-get update && apt-get install -y wget unzip software-properties-common

# install texlive
RUN add-apt-repository -y ppa:jonathonf/texlive
RUN apt-get update && apt-get install -y \
    texlive-full \
    pandoc

# add noto fonts
RUN wget https://noto-website.storage.googleapis.com/pkgs/NotoSansCJKjp-hinted.zip && \
    wget https://noto-website.storage.googleapis.com/pkgs/NotoSerifCJKjp-hinted.zip && \
    unzip -o NotoSerifCJKjp-hinted.zip && \
    unzip -o NotoSansCJKjp-hinted.zip && \
    mkdir -p /usr/share/fonts/opentype/noto && \
    mv *.otf /usr/share/fonts/opentype/noto && \
    fc-cache -f -v

RUN kanji-config-updmap-sys auto
