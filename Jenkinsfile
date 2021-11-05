pipeline {
    agent any
    tools {
         maven 'maven-3.8'
    }
    stages {
        stage('compile') {
            steps {
                sh 'mvn -v'
                sh 'mvn compile'
            }
        }
        
        stage('Test') {
            steps {
                sh 'mvn test'
                echo 'Testing..'
            }
        }
        stage('build') {
            steps {
                sh 'mvn package'
            }
        }
    }
    post {
            success {
                  archiveArtifacts '*/*.jar'
                  junit '*/*.xml'
            }
    }
}