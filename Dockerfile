FROM ubuntu:22.04

ENV LANG ru_RU.utf8
ENV LC_ALL ru_RU.UTF-8

COPY . .


RUN apt update
RUN apt install wget -y
RUN wget https://repo.postgrespro.ru/pg1c-14/keys/pgpro-repo-add.sh --no-check-certificate
RUN chmod +x pgpro-repo-add.sh
RUN sh pgpro-repo-add.sh
RUN apt update
RUN apt-get install postgrespro-1c-14 -y
RUN cat /pg_hba.conf > var/lib/pgpro/1c-14/data/pg_hba.conf
RUN cat /postgresql.conf > var/lib/pgpro/1c-14/data/postgresql.conf

VOLUME /tmp/$PGDATA

EXPOSE 5432

CMD ["postgres"]