aws_account = 795992958754
aws_region = us-east-2
component = devops-java
repo = $(aws_account).dkr.$(aws_region).amazonaws.com/$(component)
tag = latest

clean:
	mvn clean

build:
	mvn package

tomcat: jar
	mvn tomcat:run

image: jar
	docker build . -t $(repo):$(tag)

push: image
	docker push $(repo):$(tag)
