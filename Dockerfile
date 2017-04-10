FROM centos:centos7
MAINTAINER luochun <luo_chun@massclouds.com>

WORKDIR /tmp/

RUN yum install epel-release python-setuptools -y

RUN curl -LOs  https://pypi.python.org/packages/11/b6/abcb525026a4be042b486df43905d6893fb04f05aac21c32c638e939e447/pip-9.0.1.tar.gz

RUN tar zvxf pip-9.0.1.tar.gz && cd pip-9.0.1 && python setup.py install && cd .. && rm -rf pip*
 
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
    -y && yum clean all
	
RUN pip install --no-cache-dir pyzmq && pip install MySQL-python && pip install PyMySQL 

COPY ./requirements.txt /tmp/

RUN pip install  -r requirements.txt

