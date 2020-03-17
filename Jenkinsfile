pipeline {
    triggers {
        issueCommentTrigger('.*/build.*')
    }
    agent {
        node {
            label 'master'
        }
    }
    tools {
        maven 'maven-3.6.3'
        jdk 'jdk-8'
    }
    environment {
        AWS_ACCOUNT             = '795992958754'
        AWS_REGION              = 'us-east-2'
        COMPONENT               = 'devops-java'
    }
    parameters {
        booleanParam(
            name:           'SKIP_TESTS',
            defaultValue:   'false',
            description:    'toggle maven unit tests'
        )
    }
    stages {
        stage('docker-build') {
            steps {
                withAWS(credentials: 'aws-iam-jenkins', region: 'us-east-2') {
                    sh '''
                        # login to docker registry
                        $(aws ecr get-login --no-include-email)
                        make clean test push
                    '''
                    }
            }
        }
    }
    post {
        success {
            slackSend (
                color: '#00FF00',
                message: "<${env.BUILD_URL}|PKG SUCCESS>:\nJob: ${env.JOB_NAME}"
            )
        }
        failure {
            slackSend (
                color: '#FF0000',
                message: "<${env.BUILD_URL}|PKG FAIL>:\nJob: ${env.JOB_NAME}"
            )
        }
        always {
            junit allowEmptyResults: true, testResults: 'target/surefire-reports/**/*.xml'
            junit allowEmptyResults: true, testResults: 'target/failsafe-reports/**/*.xml'
        }
    }
}
