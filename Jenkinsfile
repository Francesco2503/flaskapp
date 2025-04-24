pipeline {
agent any

stages {
stage('Checkout') {
steps {
checkout scm
}
}

stage('Build') {
steps {
bat 'docker build -t flask-app .'
}
}

stage('Test') {
  steps {
    bat 'docker run -d -p 5000:5000 --name flaskapp_test flask-app'
    // Attesa con retry
    script {
      def maxRetries = 5
      def success = false
      for (int i = 0; i < maxRetries; i++) {
        def status = bat(script: 'curl -s http://localhost:5000', returnStatus: true)
        if (status == 0) {
          success = true
          echo 'App is up!'
          break
        }
        echo "App not ready yet... retrying (${i+1}/${maxRetries})"
        sleep 3
      }
      if (!success) {
        error "App non ha risposto correttamente dopo ${maxRetries} tentativi"
      }
    }
    bat 'docker stop flaskapp_test'
    bat 'docker rm flaskapp_test'
  }
}

}
}