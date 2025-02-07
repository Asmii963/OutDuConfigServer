# Stage 1: Build the JAR file
FROM maven:3.8.5-openjdk-8 AS builder
WORKDIR /app
COPY pom.xml ./
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Create the runtime image
FROM openjdk:8-jdk-alpine
WORKDIR /app
EXPOSE 8888
COPY --from=builder /app/target/OutduConfigServer-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/app.jar"]
