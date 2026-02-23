FROM tomcat:9-jdk17
COPY target/simple-app.war /usr/local/tomcat/webapps/
