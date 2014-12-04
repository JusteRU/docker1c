FROM	httpd:2.2

RUN	mkdir /root/install
ADD	install /root/install/

RUN	dpkg -i /root/install/*.deb

RUN	rm -rf /root/install

RUN	mkdir /1cconf
RUN	chown www-data:www-data -R /1cconf
RUN	mkdir /1c
RUN	chown www-data:www-data -R /1c
RUN	/opt/1C/v8.3/x86_64/webinst -apache22 -wsdir base1c -dir '/1cconf/' \
	 -connStr 'File="/1c/base1c";' -confPath /usr/local/apache2/conf/httpd.conf
#	'Srvr="192.168.10.223";Ref="base1c"' -confPath /usr/local/apache2/conf/httpd.conf
