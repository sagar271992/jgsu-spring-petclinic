pipeline {
    agent any
    tools {
         maven 'maven-3.8'
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn -v'
                sh 'mvn clean'
                sh 'mvn compile'
                echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                sh 'mvn package'
                echo 'Deploying....'
            }
        }
    }
}