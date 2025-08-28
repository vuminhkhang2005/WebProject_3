# Dùng Tomcat base image
FROM tomcat:9.0-jdk17-temurin

# Xoá webapps mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR từ Maven target → Tomcat ROOT
COPY target/survey.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Chạy Tomcat
CMD ["catalina.sh", "run"]
