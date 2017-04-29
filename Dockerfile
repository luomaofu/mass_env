FROM centos:centos7
MAINTAINER luochun <luo_chun@massclouds.com>

WORKDIR /tmp/

RUN yum install epel-release python-setuptools -y

RUN curl -O https://bootstrap.pypa.io/get-pip.py && python get-pip.py

RUN yum install gcc \
    make \
    python-devel  \
    mysql-devel \
    zeromq \
    zeromq-devel \
    bzip2-devel \
    libcurl \
    libcurl-devel \
    openssl-devel \
    libevent-devel \
    libffi-devel \
    glib2-devel \
    libjpeg-devel \
    mysql-devel \
    postgresql-devel \
    ncurses-devel \
    readline \
    readline-devel \
    sqlite-devel \
    openssl \
    openssl-devel \
    libxml2-devel \
    libxslt-devel \
    zlib-devel \
    libyaml-devel \
    wget \
    git \
    vim \
    iotop \
    -y && yum clean all

COPY ./requirements.txt /tmp/

RUN pip install  -r requirements.txt

