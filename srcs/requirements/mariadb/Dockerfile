FROM debian:buster

ARG DB_DATABASE
ARG DB_ROOT_PASSWORD
ARG DB_USER

# Basic init
RUN apt-get update -y \
&&  apt-get upgrade -y

# Install MariaDB
RUN apt-get install mariadb-server -y

# Install dumb-init
RUN apt-get install -y dumb-init


EXPOSE 3306

COPY ./tools/entrypoint.sh ./
RUN chmod 777 ./entrypoint.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["sh", "./entrypoint.sh"]

