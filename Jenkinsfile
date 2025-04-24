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
bat 'curl -s http://localhost:5000'
bat 'docker stop flaskapp_test'
bat 'docker rm flaskapp_test'
}
}
}
}