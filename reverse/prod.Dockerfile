FROM httpd:2.4-alpine

# Misc
RUN alias lsd='ls -aslh'

# Config files
COPY httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./extra/*.conf /usr/local/apache2/conf/extra/

# SSL
COPY ./ssl /usr/local/apache2/ssl
