# https://runnable.com/docker/java/dockerize-your-java-application
FROM    maven:3.6-jdk-8 as builder
RUN     mkdir /build
COPY    . /build
#COPY    ~/.m2/ /root/.m2/
RUN     mvn \
            --batch-mode \
            --file /build/pom.xml \
            clean \
            install

# https://aspetraining.com/resources/blog/deploying-your-first-web-app-to-tomcat-on-docker
FROM    tomcat:8-jdk8
  # 8.0-jdk8-openjdk
COPY    --from=builder /build/target/devops.war /usr/local/tomcat/webapps/
#COPY    target/devops.war /usr/local/tomcat/webapps/

EXPOSE  8080
CMD     ["catalina.sh", "run"]

# https://stackoverflow.com/questions/29201262/deploying-java-webapp-to-tomcat-8-running-in-docker-container
