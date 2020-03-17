aws_account = 795992958754
aws_region = us-east-2
component = devops-java
repo = $(aws_account).dkr.ecr.$(aws_region).amazonaws.com/$(component)
tag = latest

clean:
	mvn --batch-mode clean

build:
	mvn --batch-mode package

serve: build
	mvn --batch-mode tomcat:run

image: build
	docker build . -t $(repo):$(tag)

push: image
	docker push $(repo):$(tag)
