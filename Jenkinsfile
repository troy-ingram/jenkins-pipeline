pipeline {
  agent any
  stages {
    stage('Init') {
      steps {
        sh 'ls'
        sh 'export TF_IN_AUTOMATION=true'
        sh 'terraform init -no-color'
      }
    }
    stage('Plan') {
      steps {
        sh 'export TF_IN_AUTOMATION=true'
        sh 'terraform plan -no-color'
      }
    }
  }
}