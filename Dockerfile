FROM tomcat:9-jdk17
COPY target/simple-app-1.0.war /usr/local/tomcat/webapps/simple-app.war
