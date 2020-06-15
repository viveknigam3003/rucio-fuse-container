FROM centos:7

RUN yum search epel-release
RUN yum info epel-release
RUN yum install epel-release -y
RUN yum update -y
RUN yum install -y fuse \
gfal2 \
gfal2-util \
gfal2-all \
gfal2-python3 \
globus-proxy-utils \
xrootd-client \
xrootd-libs \
gcc-c++ \
make \
cmake3 \
fuse-devel \
libcurl-devel \
git \
vim \
python3 \
python-pip
RUN yum install -y centos-release-scl
RUN yum install -y devtoolset-8-gcc \
devtoolset-8-gcc-c++

RUN pip3 install --upgrade pip setuptools wheel
RUN pip3 install rucio-clients

RUN ln -s /usr/bin/cmake3 /usr/bin/cmake
RUN echo 'source scl_source enable devtoolset-8' >> ~/.bashrc

COPY 5fca1cb1.0 /etc/grid-security/certificates/5fca1cb1.0

WORKDIR  /home
RUN git clone https://github.com/rucio/fuse-posix.git
RUN scl enable devtoolset-8 /home/fuse-posix/build.sh
