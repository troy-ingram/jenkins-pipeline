pipeline {
  agent any
  environment {
    TF_IN_AUTOMATION = 'true'
    TF_CLI_CONFIG_FILE = credentials('tf-docker-creds')
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
    stage('Destroy') {
      steps {
        sh 'terraform destroy -auto-approve -no-color'
      }
    }
  }
}