pipeline {
    agent any

    environment {
        PATH = "/usr/local/bin/terraform:$PATH"
    }

    stages {
        stage('Declarative: Checkout SCM') {
            steps {
                script {
                    dir("${WORKSPACE}/to/devops2023/terraform/dev") {
                        sh 'cp terraform-config/main.tf .'
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

        stage('Terraform Plan B') {
            steps {
                script {
                    def terraformDir = "${WORKSPACE}/to/devops2023/terraform/dev"
                    dir(terraformDir) {
                        sh 'terraform plan'
                    }
                }
            }
        }

        stage('Terraform Apply A') {
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

