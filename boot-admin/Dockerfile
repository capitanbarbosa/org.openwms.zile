FROM openjdk:17-jdk-slim
WORKDIR /app
COPY spring-boot-admin.jar app.jar
EXPOSE 8090
ENTRYPOINT ["java", "-jar", "app.jar"]
