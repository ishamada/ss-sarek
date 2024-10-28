# Dockerfile for Skygenic Dev ver 1:0 # Author:islam.salah@gmail.com
# Use Debian as the base image
# FROM debian:latest
FROM debian:bullseye-slim

# # Install necessary dependencies & R
RUN apt-get update && apt-get install -y \
    wget \
    build-essential \
    zlib1g-dev \
    libncurses5-dev \
    libbz2-dev \
    liblzma-dev \
    libssl-dev \
    libreadline-dev \
    libsqlite3-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    libssl-dev \
    r-base \
    && rm -rf /var/lib/apt/lists/*

# Install Bioconductor
RUN R -e "install.packages('BiocManager')"
# Install R packages
RUN R -e "install.packages(c('vcfR', 'dplyr', 'DT', 'ggplot2', 'tidyverse', 'tidyr', 'stringr', 'scales', 'ggstats'), repos='http://cran.rstudio.com/')"

# Install Bioconductor packages
RUN R -e "BiocManager::install(c('clusterProfiler', 'org.Hs.eg.db', 'DOSE', 'EnsDb.Hsapiens.v86', 'trackViewer'))"

# Set the working directory
# WORKDIR /xxx

# COPY 

# Set the entrypoint to samtools
# ENTRYPOINT ["samtools"]

ENV PATH=$PATH:/usr/games/

CMD ["/bin/bash"]
