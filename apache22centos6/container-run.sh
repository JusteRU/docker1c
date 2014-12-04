#!/bin/bash

# apache user to 1c group
usermod -a -G grp1cv8 apache
# files access
chown apache:grp1cv8 -R /1cconf
chmod 0770 -R /1cconf
chown apache:grp1cv8 -R /1c
chmod 0770 -R /1c
httpd -DFOREGROUND

