FROM adoptopenjdk/openjdk11:jdk-11.0.2.9-slim

COPY target/0.0.1-SNAPSHOT.jar /app.jar

ENTRYPOINT ["java","-jar","/app.jar"]