#!/usr/bin/sh

cd /usr/src/app
git clone https://github.com/XMLTV/xmltv
cd xmltv
echo "y" | perl Makefile.PL
make test
make install
