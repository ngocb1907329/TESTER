pipeline {
    agent any

    tools {
        nodejs 'NodeJs'
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out code...'
                checkout scm
            }
        }

        stage('Test') {
            steps {
                echo 'Testing...'
                sh 'node -v'
                sh 'npm -v'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
                echo 'Building...'
                sh 'echo "Building the application..."'
            }
        }

        stage('Docker Build') {
            steps {
                // echo 'Deploying...'
                // sh 'echo "Deployment script goes here"'
                sh 'docker build -t my-node-app:1.0 .'
            }
        }
        
    }

    post {
        always {
            echo 'Cleaning up...'
        }
    }
}