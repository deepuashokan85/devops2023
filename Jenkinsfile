

pipeline {
    agent any

    environment {
        PATH = "/usr/local/bin/terraform:$PATH" // Add the directory where Terraform is installed
    }

    stages {
        stage('Terraform Init') {
            steps {
                script {
                    def credentialsId = 'dab5d669-9ff1-4c66-adef-5c65fd23ae9f'
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: credentialsId, accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                        def terraformDir = "${WORKSPACE}/terraform/dev" // Update with your actual directory
                        dir(terraformDir) {
                            sh 'ls -la' // This line lists files in the directory (optional for debugging)
                            sh 'terraform init' // Run Terraform init
                        }
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
                        sh 'ls -la' // This line lists files in the directory (optional for debugging)
                        sh 'terraform apply' // Run Terraform apply
                    }
                }
            }
        }
    }

    post {
        always {
            // Clean up steps that should be executed regardless of success or failure
            deleteDir()
        }
    }
}
