pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-creds').username
        AWS_SECRET_ACCESS_KEY = credentials('aws-creds').password
        AWS_DEFAULT_REGION    = "ap-south-1"
    }

    stages {

        stage('Checkout') {
            steps {
                git 'https://github.com/mahesh/terraform-aws-simple.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Approval') {
            steps {
                input message: "Approve Infrastructure Creation?"
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }

    post {
        success {
            echo "Infrastructure Created Successfully"
        }
        failure {
            echo "Pipeline Failed"
        }
    }
}