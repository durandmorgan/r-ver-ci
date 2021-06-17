ARG TAG_NAME=latest

FROM rocker/r-ver:${TAG_NAME}

LABEL org.label-schema.license="GPL-2.0" \
      org.label-schema.vcs-url="https://github.com/durandmorgan/r-ver-ci" \
      maintainer="Morgan Durand"

RUN apt-get update && apt-get install -y \
    libxml2-dev \
    && rm -rf /var/lib/apt/lists/*

RUN install2.r \ 
    devtools \ 
    roxygen \ 
    renv \ 
    remotes \
    && rm /tmp/downloaded_packages/*
