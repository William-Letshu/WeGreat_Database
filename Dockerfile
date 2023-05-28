FROM postgres:latest

ENV POSTGRES_DB=SaaS_DB
ENV POSTGRES_PASSWORD=SaaS123@

ADD schema_v2.sql /docker-entrypoint-initdb.d/
