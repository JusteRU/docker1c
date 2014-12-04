FROM	centos:centos6

# Install apache
RUN	yum install httpd -y \
	&& chkconfig httpd on

# Making some working dirs
RUN	mkdir /1cconf \
	&& chown apache:apache -R /1cconf \
	&& mkdir /1c \
	&& chown apache:apache -R /1c

# Inserting 1C packages
ADD	install /root/install/

# Install 1C packages
RUN	yum install -y /root/install/*.rpm \
	&& rm -rf /root/install

# Configuring 1C apache module - it doesn't working
# RUN	/opt/1C/v8.3/x86_64/webinst -apache22 -wsdir base1c -dir '/1cconf/' \
#	-connStr 'File="/1c/base1c";' -confPath /usr/local/apache2/conf/httpd.conf \
#	&& /etc/init.d/httpd restart

# Opening ports
EXPOSE 80

# Inserting apache configuring
ADD	1cmodule.conf /etc/httpd/conf.d/

# Command to run apache
CMD ["httpd", "-DFOREGROUND"]