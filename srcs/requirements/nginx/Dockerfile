FROM debian:buster

RUN apt-get update \
&& apt-get install -y nginx \
&& apt-get clean

COPY ./conf/nginx.conf /etc/nginx/sites-available/default

# RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

EXPOSE  80

ENTRYPOINT ["nginx", "-g", "daemon off;"]