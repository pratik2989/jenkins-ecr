pipeline {
    agent any

    environment {
        AWS_REGION = "us-east-1"
        ECR_REPO = "569144120195.dkr.ecr.us-east-1.amazonaws.com/devops-app"
        IMAGE_TAG = "latest"
    }

    stages {

        stage('Clone') {
            steps {
                git 'https://github.com/pratik2989/jenkins-ecr.git'
            }
        }

        stage('Maven Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t devops-app .'
            }
        }

        stage('Login to ECR') {
            steps {
                sh '''
                aws ecr get-login-password --region $AWS_REGION \
                | docker login --username AWS --password-stdin 569144120195.dkr.ecr.us-east-1.amazonaws.com
                '''
            }
        }

        stage('Tag Image') {
            steps {
                sh 'docker tag devops-app:latest $ECR_REPO:$IMAGE_TAG'
            }
        }

        stage('Push Image') {
            steps {
                sh 'docker push $ECR_REPO:$IMAGE_TAG'
            }
        }
    }
}
