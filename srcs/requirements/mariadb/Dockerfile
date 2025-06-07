FROM debian:bullseye

# PACKAGES
RUN apt update -y && apt upgrade -y && apt install -y mariadb-server mariadb-client gettext-base

# CONFIG
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
RUN mkdir entrypoint-initdb.d
COPY ./tools/init.sql.template /entrypoint-initdb.d
RUN mkdir -p /run/mysqld
RUN chown -R mysql:mysql /run/mysqld

# SCRIPT
COPY ./tools/entrypoint.sh .
RUN chmod +x entrypoint.sh

EXPOSE 3306

ENTRYPOINT [ "./entrypoint.sh" ]
CMD [ "mysqld" ]
