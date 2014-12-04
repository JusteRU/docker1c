FROM	centos:centos6

# Install apache
RUN	yum install httpd -y

# Opening ports
EXPOSE 80

# Command to run apache
CMD ["httpd", "-DFOREGROUND"]

# Adding external volume
VOLUME /1c

# Adding default.vrd to apache
ADD	default.vrd /1cconf/

# Making some working dirs
RUN	chown apache:apache -R /1cconf \
	&& chown apache:apache -R /1c

## Configuring 1C apache module - it doesn't working
# RUN	/opt/1C/v8.3/x86_64/webinst -apache22 -wsdir base1c -dir '/1cconf/' \
#	-connStr 'File="/1c/base1c";' -confPath /usr/local/apache2/conf/httpd.conf \
#	&& /etc/init.d/httpd restart

# Inserting apache configuring
ADD	1cmodule.conf /etc/httpd/conf.d/

# Inserting 1C packages
ADD	install /root/install/

# Install 1C packages
RUN	yum install -y /root/install/*.rpm \
	&& rm -rf /root/install

# test
RUN getenforce