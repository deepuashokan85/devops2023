pipeline {
    agent any

    parameters {
        choice(name: 'CHOICE', choices: ['AWS', 'AZ', 'GCP'], description: 'Pick Cloud Provider')
        string(name: 'ami_id', defaultValue: '', description: 'pass AMI ID')
        string(name: 'count', defaultValue: '', description: 'Instance Count')
        booleanParam(name: 'Destroy', defaultValue: '', description: 'Terraform Destroy')
        booleanParam(name: 'Apply', defaultValue: '', description: 'Terraform Apply')
	password(name: 'PASSWORD', defaultValue: 'SECRET', description: 'Enter a password')
    }
/* Pradeep DevOps*/
    stages {
        stage('Terraform Init') {
            steps {
		sh '''
                cd terraform
                pwd
                /usr/local/bin/terraform init
  		'''
            }
        }

        stage('Terraform Plan') {
            steps {
		sh '''
		cd terraform
 		pwd
                export TF_VAR_ami_id=$ami_id
                export TF_VAR_count_num=$count
                /usr/local/bin/terraform plan
		'''
            }
        }

        stage('Terraform Apply') {
                 when {
                 anyOf{
                        expression{Apply == true}
                 }
                }
            steps {
                sh '''
                cd terraform
                pwd
                export TF_VAR_ami_id=$ami_id
                export TF_VAR_count_num=$count
                /usr/local/bin/terraform apply --auto-approve
                '''
            }
        }

        stage('Terraform Destroy') {
                 when {
                 anyOf{
 			expression{Destroy == true}
            	 }
		}

		steps {
		sh '''
                cd terraform
 		pwd
                export TF_VAR_ami_id=$ami_id
                export TF_VAR_count_num=$count
                /usr/local/bin/terraform destroy --auto-approve
		'''
		}
            }
    }
}
