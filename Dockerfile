# Stage 1: Build the Java Application
FROM maven:3.8.8-eclipse-temurin-17 AS builder

WORKDIR /app

# Copy Maven project files
COPY . .

# Run Maven build (skipping tests for faster builds)
RUN mvn clean compile package test

# Stage 2: Create the Final Runtime Image
FROM eclipse-temurin:17-jre

WORKDIR /app

# Copy only the built JAR from the builder stage
COPY --from=builder /app/target/hello-world-webapp-1.0.0.jar app.jar

EXPOSE 9000

CMD ["java", "-jar", "app.jar"]
