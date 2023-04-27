FROM ubuntu:22.04

COPY . /postgre_1c

WORKDIR /postgre_1c

RUN wget https://repo.postgrespro.ru/pg1c-14/keys/pgpro-repo-add.sh --no-check-certificate
RUN chmod +x pgpro-repo-add.sh
RUN sh pgpro-repo-add.sh
RUN apt update
RUN apt-get install postgrespro-1c-14 -y
RUN cat /postgre_1c/pg_hba.conf > var/lib/pgpro/1c-14/data/pg_hba.conf
RUN cat /postgre_1c/postgresql.conf > var/lib/pgpro/1c-14/data/postgresql.conf
RUN systemctl restart postgrespro-1c-14

VOLUME $PGDATA

EXPOSE 5432

CMD ["postgres"]