FROM debian:buster

RUN apt-get update \
&& apt-get install -y nginx \
&& apt-get clean

# Generate SSL key and certificate
RUN apt-get install -y openssl
RUN mkdir -p /etc/nginx/ssl \
&&  chmod 700 /etc/nginx/ssl \
&&  openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:4096 -keyout /etc/nginx/ssl/tdeville.42.fr.key -out /etc/nginx/ssl/tdeville.42.fr.crt -subj /C=FR


COPY ./conf/nginx.conf /etc/nginx/sites-available/tdeville.42.fr.conf

RUN ln -s /etc/nginx/sites-available/tdeville.42.fr.conf /etc/nginx/sites-enabled/tdeville.42.fr.conf

EXPOSE  443

ENTRYPOINT ["nginx", "-g", "daemon off;"]