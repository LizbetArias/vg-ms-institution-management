# Stage 1: Build
FROM maven:3.9.2-eclipse-temurin-17 AS builder
WORKDIR /app

# Copiar pom.xml primero para aprovechar cache de Maven
COPY pom.xml .
COPY src ./src

# Build
RUN mvn clean package -DskipTests

# Stage 2: Run
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# Copiar el jar generado
COPY --from=builder /app/target/*.jar app.jar

EXPOSE 9080

# Comando para ejecutar
ENTRYPOINT ["java", "-jar", "app.jar"]
