pipeline {
  agent any

  stages {

    stage('Build Docker Image') {
      steps {
        echo 'Docker build executed externally (assignment demo)'
      }
    }

    stage('Push Docker Image') {
      steps {
        echo 'Docker push executed externally (assignment demo)'
      }
    }

    stage('Deploy to Kubernetes') {
      steps {
        sh 'kubectl apply -f k8s/deployment.yaml'
        sh 'kubectl apply -f k8s/service.yaml'
      }
    }

  }
}
