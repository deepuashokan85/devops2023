pipeline {
    agent any

    environment {
        PATH = "/usr/local/bin/terraform:$PATH" // Add the directory where Terraform is installed
    }

    stages {
        stage('Terraform Init') {
            steps {
                script {
                    def terraformDir = "${WORKSPACE}/terraform/dev" // Update with your actual directory
                    dir(terraformDir) {
                        sh 'ls -la' // List files in the Terraform directory (optional for debugging)
                        sh 'terraform init -upgrade' // Run Terraform init
                    }
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    def terraformDir = "${WORKSPACE}/terraform/dev" // Update with your actual directory
                    dir(terraformDir) {
                        sh 'terraform plan' // Run Terraform plan
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    def terraformDir = "${WORKSPACE}/terraform/dev" // Update with your actual directory
                    dir(terraformDir) {
                        sh 'ls -la' // List files in the Terraform directory (optional for debugging)
                        sh 'terraform apply  -auto-approve' // Run Terraform apply
                    }
                }
            }
        }

       stage('Terraform Destroy') {
            steps {
                script {
                    def terraformDir = "${WORKSPACE}/terraform/dev" // Update with your actual directory
                    dir(terraformDir) {
                        sh 'ls -la' // List files in the Terraform directory (optional for debugging)
                        sh 'terraform destroy  -auto-approve' // Run Terraform apply
                    }
                }
            }
        }
    }
}

