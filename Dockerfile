FROM centos:latest

RUN yum update -y && \
        yum install -y perl perl-Net-SSLeay unzip && \
	yum clean all && \
        rm -rf /var/cache/yum/*

ADD https://github.com/sullo/nikto/archive/master.zip /opt/

WORKDIR /opt

RUN unzip master.zip \
        && echo "EXECDIR=/opt/nikto-master/program" >> /opt/nikto-master/program/nikto.conf \
        && ln -s /opt/nikto-master/program/nikto.conf /etc/nikto.conf \
        && ln -s /opt/nikto-master/program/nikto.pl /usr/bin/nikto \
        && nikto -update

WORKDIR /root

CMD ["nikto"]
