COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Run with lightweight JREs
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar

EXPOSE 9080