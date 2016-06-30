# Based on Ubuntu 14.04 Trust Tahr base image
FROM ubuntu:trusty

ENV W_DIR /usr/local
WORKDIR $W_DIR

RUN apt-get -q update && apt-get -q -y install \
        software-properties-common \
        wget && \
    add-apt-repository ppa:webupd8team/java && \
    apt-get -y update && \
    apt-get -y -q dist-upgrade && \
    apt-get -y -q upgrade && \
    apt-get -y -q install \
        git \
        pkg-config \
        mc \
        lxterminal \
        build-essential \
        libtool \
        autotools-dev \
        autoconf \
        libssl-dev 


RUN apt-get -y install libboost-all-dev
RUN add-apt-repository ppa:bitcoin/bitcoin && sudo apt-get update
RUN apt-get -y install libdb4.8-dev libdb4.8++-dev
RUN apt-get -y install libminiupnpc-dev
RUN apt-get -y install libqt4-dev 
RUN apt-get -y install libprotobuf-dev protobuf-compiler
RUN apt-get -y install libqrencode-dev
RUN apt-get install bsdmainutils
RUN apt-get -y install curl

RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections && \
    apt-get -y -q install \
        oracle-java8-installer \
        oracle-java8-set-default && \
    apt-get clean && \
    update-java-alternatives -s java-8-oracle


RUN git clone https://github.com/OmniLayer/omnicore.git && cd $W_DIR/omnicore && ./autogen.sh && ./configure && make

RUN mkdir /root/.bitcoin

ADD bitcoin.conf /root/.bitcoin

EXPOSE 18332

ENTRYPOINT lxterminal -e /usr/local/omnicore/src/qt/omnicore-qt