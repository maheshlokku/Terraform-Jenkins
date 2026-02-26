pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = "ap-south-1"
    }

    options {
        ansiColor('xterm')
        buildDiscarder(logRotator(numToKeepStr: '10'))
        timestamps()
    }

    stages {

        stage('Checkout Code') {
            steps {
                // Shallow clone to reduce runtime
                git branch: 'main',
                    url: 'https://github.com/maheshlokku/Terraform-Jenkins-Aws.git',
                    shallow: true
            }
        }

        stage('Terraform Stages') {
            parallel {

                stage('Terraform Init & Validate') {
                    steps {
                        dir('Environments') {
                            withAWS(credentials: 'aws-creds', region: env.AWS_DEFAULT_REGION) {
                                bat """
                                    terraform init
                                    terraform validate
                                """
                            }
                        }
                    }
                }

                stage('Terraform Plan') {
                    steps {
                        dir('Environments') {
                            withAWS(credentials: 'aws-creds', region: env.AWS_DEFAULT_REGION) {
                                bat 'terraform plan -out=tfplan'
                            }
                        }
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
                dir('Environments') {
                    withAWS(credentials: 'aws-creds', region: env.AWS_DEFAULT_REGION) {
                        bat 'terraform apply -auto-approve tfplan'
                    }
                }
            }
        }
    }

    post {
        always {
            echo "Cleaning workspace..."
            cleanWs()
        }

        success {
            echo "Terraform execution completed successfully."
        }

        failure {
            echo "Terraform execution failed!"
        }
    }
}
