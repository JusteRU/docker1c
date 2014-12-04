FROM	centos:centos6

RUN	yum install httpd

RUN	mkdir /1cconf \
	&& chown apache:apache -R /1cconf \
	&& mkdir /1c \
	&& chown apache:apache -R /1c

ADD	install /root/install/

RUN	yum install -y /root/install/*.rpm \
	&& rm -rf /root/install