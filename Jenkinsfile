pipeline {
    agent any

    tools {
        nodejs 'NodeJs'
    }

    environment {
        DOCKER_HUB_REPO= '  /test_push'
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
        stage('Docker Push') {
            steps {
                echo 'Pushing Docker image...'
                sh 'docker tag my-node-app:1.0 myregistry/my-node-app:1.0'
                sh 'docker push myregistry/my-node-app:1.0'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    withCredentials([usernamePassword(
                        credentialsId: 'test_push', 
                        usernameVariable: 'DOCKER_USERNAME', 
                        passwordVariable: 'DOCKER_PASSWORD')]) 
                        {
                            sh '''
                                echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin
                                docker tag my-node-app:1.0 $DOCKER_HUB_REPO:1.0
                                docker push $DOCKER_HUB_REPO:1.0
                            '''
                    }
                }
            }
        }
        
    }

    post {
        always {
            echo 'Cleaning up...'
        }
    }
}