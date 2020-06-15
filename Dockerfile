FROM centos:7

RUN yum search epel-release
RUN yum info epel-release
RUN yum install epel-release -y
RUN yum update -y

RUN yum install -y git \
vim \
gcc \
gcc-c++ \
make \
python3 \
python-pip \
fuse \
cmake3 \
fuse-devel \
libcurl-devel \
centos-release-scl \
devtoolset-7-gcc-c++ \
gfal2 \
gfal2-util \
gfal2-all \
globus-proxy-utils \
xrootd-client \
xrootd-libs 

WORKDIR  /home
RUN git clone https://github.com/rucio/fuse-posix.git
RUN git clone https://github.com/rucio/rucio.git
RUN chmod 600 /home/rucio/etc/certs/ruciouser.key.pem
RUN pip3 install --upgrade pip setuptools wheel
RUN pip3 install rucio-clients
WORKDIR /home/rucio/etc
RUN cp rucio.cfg.template rucio.cfg

WORKDIR /home

RUN echo 'export RUCIO_HOME="/home/rucio"' >> ~/.bashrc
RUN echo 'export X509_USER_CERT="/home/rucio/etc/certs/ruciouser.pem"' >> ~/.bashrc
RUN echo 'export X509_USER_KEY="/home/rucio/etc/certs/ruciouser.key.pem"' >> ~/.bashrc

COPY 5fca1cb1.0 /etc/grid-security/certificates/5fca1cb1.0
COPY hostcert.pem /etc/grid-security
COPY hostkey.pem /etc/grid-security