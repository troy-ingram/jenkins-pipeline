pipeline {
  agent any
  environment {
    TF_IN_AUTOMATION = 'true'
    TF_CLI_CONFIG_FILE = credentials('tf-docker-creds')
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
    stage('Apply') {
      steps {
        sh 'terraform apply -auto-approve -no-color'
      }
    }
    stage('EC2 Wait') {
      steps {
        sh 'aws ec2 wait instance-status-ok --region us-east-1'
      }
    }
    stage('Ansible') {
     steps {
      ansiblePlaybook(credentiasId: 'wpkey', inventory: 'aws_hosts', playbook: 'playbooks/docker.yml')
     }
    }
    stage('Destroy') {
      steps {
        sh 'terraform destroy -auto-approve -no-color'
      }
    }
  post {
    success {
      echo 'Success!'
    }
    failure {
    sh 'terraform destroy -auto-approve -no-color'
    }
  }
}