# Dùng Tomcat base image
FROM tomcat:9.0-jdk17-temurin

# Xoá webapps mặc định để chỉ còn app của bạn
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR từ Maven target → Tomcat ROOT
COPY target/survey.war /usr/local/tomcat/webapps/ROOT.war

# Copy logo từ resources (nếu bạn dùng JSP/HTML để load ảnh trực tiếp)
# -> Ảnh tĩnh nên để trong thư mục ROOT/images/
COPY src/main/resources/murachlogo.png /usr/local/tomcat/webapps/ROOT/images/murachlogo.png

# Expose port 8080
EXPOSE 8080

# Run Tomcat
CMD ["catalina.sh", "run"]
