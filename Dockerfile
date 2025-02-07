FROM eclipse-temurin:17-jre

COPY . /app

WORKDIR /app

# Copy the pre-built jar file from your target directory
COPY hello-world-webapp-1.0.0.jar app.jar

# Expose the port the app runs on
EXPOSE 8080

# Run the jar file
CMD ["java", "-jar", "app.jar"]