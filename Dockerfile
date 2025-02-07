# Stage 1: Build the JAR file
FROM eclipse-temurin:21-jdk-alpine AS builder
WORKDIR /app
RUN apt-get update && apt-get install -y maven
COPY pom.xml ./
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Create the runtime image
FROM eclipse-temurin:21-jdk-alpine
WORKDIR /app
EXPOSE 8888
COPY --from=builder /app/target/OutduConfigServer-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/app.jar"]
