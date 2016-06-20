FROM java:7

ADD https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/4.0.2/flyway-commandline-4.0.2.zip /flyway.zip

RUN unzip /flyway.zip && rm /flyway.zip && mv /flyway* /flyway && ln -s /flyway/flyway /usr/local/bin/flyway

COPY ./flyway.conf /flyway/conf

RUN flyway 2>&1 | grep "Flyway"

WORKDIR /flyway
ENTRYPOINT ["flyway"]
CMD ["--help"]
