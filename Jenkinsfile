pipeline {
    agent any
    environment {
        TF_IN_AUTOMATION = 'true'
        AWS_SHARED_CREDENTIALS_FILE='/home/ubuntu/.aws/credentials'
    }
    stages {
        stage('Init') {
            steps {
                sh 'ls'
                sh 'terraform init -no-color'
            }
        }
        stage('Plan') {
            steps {
                sh 'terraform plan -no-color'
            }
        }
        stage('Validate Apply') {
            input {
                message "Do you want to Apply this plan?"
                ok "Apply"
            }
            steps {
                echo 'Apply Accepted'
            }
        }
        stage('Apply') {
            steps {
                sh 'terraform apply -auto-approve -no-color'
            }
        }
        stage('Inventory') {
          steps {
                sh '''printf \\
                    "\\n$(terraform output -json instance_ips | jq -r \'.[]\')" \\
                    >> aws_hosts'''
            }
        }
        stage('EC2 Wait') {
            steps {
                sh '''aws ec2 wait instance-status-ok \\
                      --instance-ids $(terraform output -json instance_ids | jq -r \'.[]\') \\
                      --region us-east-1'''
            }
        }
        stage('Validate Ansible') {
            input {
                message "Do you want to run Ansible?"
                ok "Run Ansible"
            }
            steps {
                echo 'Ansible Approved'
            }
        }
        stage('Ansible') {
            steps {
                ansiblePlaybook(credentialsId: 'wpkey', inventory: 'aws_hosts', playbook: 'playbooks/docker.yml')
            }
        }
        stage('Validate Destroy') {
            input {
                message "Do you want to destroy?"
                ok "Destroy"
            }
            steps {
                echo 'Destroy Approved'
            }
        }
        stage('Destroy') {
            steps {
                sh 'terraform destroy -auto-approve -no-color'
            }
        }
    }
    post {
        success {
            echo 'Success!'
        }
        failure {
            sh 'terraform destroy -auto-approve -no-color'
        }
        aborted {
            sh 'terraform destroy -auto-approve -no-color'
        }
    }
}