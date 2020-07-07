FROM rocker/r-ver:3.6

MAINTAINER Hao He "haohe90@gmail.com"

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

RUN apt-get update --yes && \
    apt-get install --no-install-recommends --yes \
    build-essential \
    cmake \
    git \
    libbamtools-dev \
    libboost-dev \
    libboost-iostreams-dev \
    libboost-log-dev \
    libboost-system-dev \
    libboost-test-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    libz-dev \
    libbz2-dev \
    liblzma-dev \ 
    curl \
    libhdf5-cpp-100 \ 
    libarmadillo7 \
    libarmadillo-dev

RUN R -e 'options(repos=c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); install.packages(c("devtools", "Rcpp","RcppArmadillo", "Matrix", "mgcv", "abind","igraph","h5","Rtsne","cluster","data.table","BiocManager"))'

RUN R -e 'options(repos=c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")); options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor"); BiocManager::install(c("pcaMethods","Rhtslib","edgeR","Rsamtools","GenomicAlignments","GenomeInfoDb","Biostrings"),suppressAutoUpdate=TRUE,ask=FALSE,suppressUpdates=TRUE)'

RUN git clone https://github.com/velocyto-team/velocyto.R && \
    R -e 'devtools::install_local("velocyto.R",dependencies=T,upgrade="never")'

ENTRYPOINT ["/bin/bash"]


#  $ docker build . -t antiguos/velocyto:latest -t antiguos/velocyto:1.0
#  $ docker run --name velocyto -it antiguos/velocyto:latest /bin/bash
#  $ docker push antiguos/ngstools:latest
#  $ docker push antiguos/ngstools:1.0
