pipeline {
    agent any

    environment {
        AWS_REGION = "us-east-1"
        ECR_REPO = "569144120195.dkr.ecr.us-east-1.amazonaws.com/java-app-repo"
        IMAGE_TAG = "latest"
    }

    stages {

        stage('Clone') {
            steps {
                git 'https://github.com/pratik2989/jenkins-ecr.git'
            }
        }

        stage('Build Maven') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $ECR_REPO:$IMAGE_TAG .'
            }
        }

        stage('Login to ECR') {
            steps {
                sh '''
                aws ecr get-login-password --region $AWS_REGION | \
                docker login --username AWS --password-stdin $ECR_REPO
                '''
            }
        }

        stage('Push Image to ECR') {
            steps {
                sh 'docker push $ECR_REPO:$IMAGE_TAG'
            }
        }
    }
}
