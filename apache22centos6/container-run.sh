#!/bin/bash

chown apache:apache -R /1cconf
chown apache:apache -R /1c
httpd -DFOREGROUND

