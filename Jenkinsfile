pipeline {
    agent any

    environment {
        PATH = "/usr/local/bin/terraform:$PATH" // Add the directory where Terraform is installed
    }

    stages {
        stage('Terraform Init') {
            steps {
                script {
                    def terraformDir = "${WORKSPACE}/to/root/devops2023/terraform/dev"
                    dir(terraformDir) {
                       sh'terraform init'
                    }
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    def terraformDir = "${WORKSPACE}/to/root/devops2023/terraform/dev"
                    dir(terraformDir) {
                       sh'terraform plan'
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    def terraformDir = "${WORKSPACE}/to/root/devops2023/terraform/dev"
                    dir(terraformDir) {
                       sh'terraform apply'
                    }
                }
            }
        }
     }

