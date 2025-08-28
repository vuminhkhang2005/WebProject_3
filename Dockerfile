# Stage 1: build WAR
FROM maven:3.9.2-eclipse-temurin-17 AS build
WORKDIR /app

# Copy pom + source code
COPY pom.xml .
COPY src ./src

# Build WAR
RUN mvn clean package -DskipTests

# Stage 2: chạy Tomcat
FROM tomcat:9.0-jdk17-temurin
RUN rm -rf /usr/local/tomcat/webapps/*

# COPY đúng tên WAR theo pom.xml
COPY --from=build /app/target/survey-app-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
