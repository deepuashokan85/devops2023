pipeline {
    agent any

    stages {
        
           stage('Terraform Init') {
            steps {
                    sh 'cd /var/lib/jenkins/workspace/terraformdemo/to/devops2023/terraform/dev && terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    sh 'cd /var/lib/jenkins/workspace/terraformdemo/to/devops2023/terraform/dev && terraform plan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    sh 'cd /var/lib/jenkins/workspace/terraformdemo/to/devops2023/terraform/dev && terraform apply -auto-approve'
                }
            }
        }
    }
}

