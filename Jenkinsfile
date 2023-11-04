pipeline {
    agent any

    environment {
        PATH = "/usr/local/bin/terraform:$PATH" // Add the directory where Terraform is installed
    }

    stages {
        stage('Terraform Init') {
            steps {
                script {
                    def terraformDir = "${WORKSPACE}" // Update with your actual directory
                    dir(terraformDir) {
                        sh 'ls -la ${WORKSPACE}' // This line lists files in the workspace (optional for debugging)
                        sh 'cd ${WORKSPACE}/terraform/dev'
                        sh 'terraform init' // Run Terraform init
                    }
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    def terraformDir = "${WORKSPACE}" // Update with your actual directory
                    dir(terraformDir) {
                        sh 'cd ${WORKSPACE}/terraform/dev'
                        sh 'terraform plan' // Run Terraform plan
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    def terraformDir = "${WORKSPACE}" // Update with your actual directory
                    dir(terraformDir) {
                        sh 'ls -la ${WORKSPACE}' // This line lists files in the workspace (optional for debugging)
                        sh 'cd ${WORKSPACE}/terraform/dev'
                        sh 'terraform apply' // Run Terraform apply
                    }
                }
            }
        }
    }
}

