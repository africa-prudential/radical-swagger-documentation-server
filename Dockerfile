FROM maven:3.6.3-jdk-8 AS MAVEN_BUILD

ARG SONAR_HOST_URL
ARG SONAR_TOKEN
ARG PROFILES

WORKDIR /build/

COPY pom.xml /build/

COPY src /build/src/

RUN mvn clean -U package $PROFILES -Dsonar.host.url=$SONAR_HOST_URL -Dsonar.login=$SONAR_TOKEN

FROM openjdk:8u212-alpine3.9

# Set timezone to WAT
ENV TZ=Africa/Lagos
RUN apk update && \
    apk upgrade && \
    apk add ca-certificates && update-ca-certificates && \
    apk add --update tzdata
RUN rm -rf /var/cache/apk/*

WORKDIR /app

EXPOSE 8014/tcp

COPY --from=MAVEN_BUILD /build/target/radical-swagger-documentation-server.jar /app

ENTRYPOINT ["java","-jar", "radical-swagger-documentation-server.jar"]
