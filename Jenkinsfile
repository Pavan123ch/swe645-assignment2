pipeline {
  agent any

  stages {

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t surya100599/swe645-survey:v1 .'
      }
    }

    stage('Push Docker Image') {
      steps {
        sh 'docker push surya100599/swe645-survey:v1'
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