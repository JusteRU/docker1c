FROM	centos:centos6

# Install apache
RUN	yum install httpd -y

# Opening ports
EXPOSE 80

# Command to run apache
CMD	["/container-run.sh"]

# Adding external volume
VOLUME /1c

# Adding default.vrd to apache
ADD	default.vrd /1cconf/

## Configuring 1C apache module - it doesn't working
# RUN	/opt/1C/v8.3/x86_64/webinst -apache22 -wsdir base1c -dir '/1cconf/' \
#	-connStr 'File="/1c/base1c";' -confPath /usr/local/apache2/conf/httpd.conf \
#	&& /etc/init.d/httpd restart

# Inserting apache configuring
ADD	configs/1cmodule.conf /etc/httpd/conf.d/

# Inserting 1C packages
ADD	install /root/install/

# Install 1C packages
RUN	yum install -y /root/install/*.rpm \
	&& rm -rf /root/install 

# Inserting licences
ADD	configs/nethasp.ini /opt/1C/v8.3/x86_64/conf/nethasp.ini
RUN	chown apache:grp1cv8 -R /opt/1C/v8.3/x86_64/conf

# Starting script
ADD	configs/container-run.sh /
RUN	chmod 0700 /container-run.sh

# 1C links
RUN	yum install -y tetex-afm glib2 glibc-devel glib2-devel glibc-headers glibc-static glibc-utils unixODBC libgsf ImageMagick krb5-libs

#
RUN	yum install -y ImageMagick.i686
