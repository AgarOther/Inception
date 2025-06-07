FROM debian:bullseye

# PACKAGES
RUN apt-get -y update && apt-get -y install nginx openssl

# SSL
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/certificate.crt \
-keyout /etc/nginx/ssl/certificate.key -subj \
"/C=FR/ST=NAQ/L=Angouleme/O=42/OU=42/CN=$DOMAIN_NAME/UID=scraeyme"

# CONFIG
RUN mkdir -p /var/run/nginx
COPY ./conf/nginx.conf /etc/nginx/conf.d/

EXPOSE 443
CMD [ "nginx", "-g", "daemon off;" ]
