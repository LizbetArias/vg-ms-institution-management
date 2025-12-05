FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

COPY target/vg-ms-institution-management-0.0.1-SNAPSHOT app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]