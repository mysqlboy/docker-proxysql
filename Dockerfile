FROM debian:latest

RUN apt-get -y update && \
    apt-get install -y curl vim &&\
    curl -o proxy.deb -L https://github.com/sysown/proxysql/releases/download/v1.3.1/proxysql_1.3.1-dbg-debian8_amd64.deb &&\
    dpkg -i proxy.deb

COPY ["entrypoint.sh", "/"]
COPY ["proxysql.cnf", "/etc/proxysql.cnf"]
RUN ["chmod", "755", "/entrypoint.sh"]
EXPOSE 6032 6033

ENTRYPOINT ["bash","/entrypoint.sh"]
