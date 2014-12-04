#!/bin/bash

docker run -dP --name apache1 -v /srv/webdav/base1c:/1c -p 8081:80 ap1c