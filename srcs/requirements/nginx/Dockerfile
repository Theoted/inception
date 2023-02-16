FROM debian:buster

RUN apt-get update \
&& apt-get install -y nginx \
&& apt-get clean

# COPY ./conf/nginx.conf /etc/nginx/sites-available/tdeville.42.fr.conf

# RUN ln -s /etc/nginx/sites-available/tdeville.42.fr.conf /etc/nginx/sites-enabled/tdeville.42.fr.conf

# ENTRYPOINT ["nginx", "-g", "daemon off;"]