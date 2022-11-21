ARG TAG_NAME

FROM rocker/r-ver:${TAG_NAME}

LABEL org.label-schema.license="GPL-2.0" \
      org.label-schema.vcs-url="https://github.com/durandmorgan/r-ver-ci" \
      maintainer="Morgan Durand"

ENV RENV_PATHS_CACHE /renv_cache


RUN apt-get update \
  && apt-get install -y  \
    curl \
    cmake \
    default-jre \
    default-jdk \
    git-core \
    libbz2-dev \
    libcairo2-dev \
    libcurl4-openssl-dev \
    libgit2-dev \
    libharfbuzz-dev \ 
    libicu-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    libfribidi-dev \
    libgdal-dev \
    libjpeg-dev \
    libpng-dev \
    libssh2-1-dev \
    libssl-dev \
    libtiff5-dev \
    libxml2-dev \
    libv8-dev \ 
    make \
    pandoc \
    pandoc-citeproc \
    zlib1g-dev \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-latex-extra \
    && rm -rf /var/lib/apt/lists/* \
    && curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to /usr/bin/
    

RUN mkdir /renv_cache \
    && install2.r \ 
      devtools \ 
      roxygen \ 
      renv \ 
      remotes \
    && rm /tmp/downloaded_packages/*


RUN R CMD javareconf
