# 1. Dùng Maven + JDK image để build WAR
FROM maven:3.9.2-eclipse-temurin-17 AS build

WORKDIR /app

# Copy toàn bộ source code vào container
COPY pom.xml .
COPY src ./src

# Build WAR
RUN mvn clean package -DskipTests

# 2. Dùng Tomcat image để chạy WAR
FROM tomcat:9.0-jdk17-temurin

# Xoá webapps mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR vừa build từ stage trước
COPY --from=build /app/target/survey.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
