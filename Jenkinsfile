pipeline {
    agent any

    environment {
        PATH = "/usr/local/bin/terraform:$PATH" // Add the directory where Terraform is installed
    }

    stages {
        stage('Copy Terraform Files') {
            steps {
                script {
                    def terraformDir = "${WORKSPACE}/to/devops2023/terraform/dev"
                    dir(terraformDir) {
                        // Copy your Terraform configuration files (e.g., main.tf) to this directory
                        sh 'cp /path/to/your/main.tf .'
                    }
                }
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    def terraformDir = "${WORKSPACE}/to/devops2023/terraform/dev"
                    dir(terraformDir) {
                        sh 'terraform init'
                    }
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    def terraformDir = "${WORKSPACE}/to/devops2023/terraform/dev"
                    dir(terraformDir) {
                        sh 'terraform plan'
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    def terraformDir = "${WORKSPACE}/to/devops2023/terraform/dev"
                    dir(terraformDir) {
                        sh 'terraform apply'
                    }
                }
            }
        }
    }
}

