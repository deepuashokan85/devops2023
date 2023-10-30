pipeline {
    agent any

    stages {
        
           stage('Terraform Init') {
            steps {
                    sh 'cd /devops2023/terraform/dev/to/var/lib/jenkins/workspace/terraformdemo && terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    sh 'cd /devops2023/terraform/dev/to/var/lib/jenkins/workspace/terraformdemo && terraform plan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    sh 'cd /devops2023/terraform/dev/to/var/lib/jenkins/workspace/terraformdemo && terraform apply -auto-approve'
                }
            }
        }
    }
}

