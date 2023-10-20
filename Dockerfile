# FROM ubuntu:20.04
# RUN apt-get update && apt-get install -y openssl
# RUN openssl req -x509 -newkey rsa:4096 -keyout /certs/client/ca-key.pem -out /certs/client/ca.pem -days 365 -nodes -subj "/CN=MyCA"


FROM openjdk:11

WORKDIR /app
COPY target/spring-application-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT [ "java", "-jar" , "app.jar" ]

