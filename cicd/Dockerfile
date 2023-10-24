FROM gradle:7.2.0-jdk16-hotspot AS build
ENV TZ=Asia/Ho_Chi_Minh
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build --no-daemon 

FROM adoptopenjdk/openjdk16:jre-16.0.1_9-alpine
ARG NAME_SPACE
ENV ENV_NAME_SPACE=$NAME_SPACE 

ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY

ENV AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID 
ENV AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
ENV AWS_REGION=ap-southeast-1

EXPOSE 8083
RUN mkdir /app
# RUN ls -la ./*
RUN pwd
COPY --from=build /home/gradle/src/webClient/build/libs/*SNAPSHOT.jar /app/spring-boot-application.jar
ENTRYPOINT ["java", "-XX:+HeapDumpOnOutOfMemoryError", "-Xmx2048m", "-Dspring.profiles.active=${ENV_NAME_SPACE}", "-jar", "/app/spring-boot-application.jar"]
