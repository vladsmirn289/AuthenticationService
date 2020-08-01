FROM alpine/git as clone
WORKDIR /home/authService
RUN git clone https://github.com/vladsmirn289/AuthenticationService.git

FROM maven:3.5-jdk-8-alpine as build
WORKDIR /home/authService
COPY --from=clone /home/authService/AuthenticationService .
RUN mvn package

FROM openjdk:8-jre-alpine
WORKDIR /home/authService
COPY --from=build /home/authService/target/*.jar .
ENV db_host db
CMD java -jar *.jar --db_url=jdbc:postgresql://${db_host}:5432/shop_db