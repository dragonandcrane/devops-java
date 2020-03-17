# https://aspetraining.com/resources/blog/deploying-your-first-web-app-to-tomcat-on-docker
FROM    tomcat:8-jdk8
COPY    ./target/devops-java.war /usr/local/tomcat/webapps/
