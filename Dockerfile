# Build Stage
FROM maven:3.8.7-openjdk-18-slim as build

# Set the working directory for Maven build
WORKDIR /app

# Copy pom.xml and source files
COPY pom.xml .
COPY src ./src

# Build the application, skip tests to save time in CI/CD
RUN mvn clean package -DskipTests

# Runtime Stage
FROM openjdk:17-jdk-slim as runtime

# Create a non-root user for better security
RUN addgroup --system app && adduser --system --ingroup app app

# Set the working directory in the container
WORKDIR /app

# Copy only the JAR file from the build stage to the runtime stage
COPY --from=build /app/target/task-demo-0.0.1-SNAPSHOT.jar app.jar

# Change ownership of the JAR file to the non-root user
RUN chown app:app app.jar

# Switch to the non-root user
USER app

# Expose the application port (8080 for Spring Boot by default)
EXPOSE 8080

# Define the entry point for the container to run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]



