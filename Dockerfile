FROM gradle:6.3.0-jdk11 as builder

# Copy local code to the container image.
WORKDIR /app
COPY build.gradle .
COPY settings.gradle .
COPY src ./src

# Build a release artifact.
RUN gradle build -x test

FROM adoptopenjdk/openjdk11

# Copy the jar to the production image from the builder stage.
COPY --from=builder /app/build/libs/*.jar /app.jar

# Run the web service on container startup.
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Dgrpc.port=${PORT}", "-jar","/app.jar"]