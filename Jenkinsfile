pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = "ap-south-1"
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/maheshlokku/Terraform-Jenkins.git'
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform') {   // 👈 IMPORTANT
                    withCredentials([[
                        $class: 'AmazonWebServicesCredentialsBinding',
                        credentialsId: 'aws-creds'
                    ]]) {
                        bat 'terraform init'
                    }
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                dir('terraform') {
                    bat 'terraform validate'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('terraform') {
                    withCredentials([[
                        $class: 'AmazonWebServicesCredentialsBinding',
                        credentialsId: 'aws-creds'
                    ]]) {
                        bat 'terraform plan -out=tfplan'
                    }
                }
            }
        }

        stage('Approval') {
            steps {
                input message: "Approve Infrastructure Creation?"
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    withCredentials([[
                        $class: 'AmazonWebServicesCredentialsBinding',
                        credentialsId: 'aws-creds'
                    ]]) {
                        bat 'terraform apply -auto-approve tfplan'
                    }
                }
            }
        }
    }
}