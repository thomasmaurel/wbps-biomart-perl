#!/bin/bash

if [ -z "$APACHE_HOME" ]; then
    if type httpd 2>/dev/null; then
      /nfs/public/release/ensweb-software/sharedsw/2017_04_03/linuxbrew/Cellar/httpd22/2.2.31/bin/httpd -k restart -d $PWD -f $ENSEMBL_MART_CONF_DIR/httpd.conf
	exit 0
    else 
	echo "Please set APACHE_HOME to the location of your Apache installation" 1>&2
	exit 1
    fi
fi
export PERL5LIB=${APACHE_HOME}/lib/site_perl
# Restart apache server
echo "Restarting Apache..."
${APACHE_HOME}/bin/httpd -k restart -d $PWD -f $PWD/conf/httpd.conf 
