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
                junit '**/target/surefire-reports/TEST-*.xml'
                archiveArtifacts 'target/*.jar'
            }
        }
        stage('deploy') {
            steps {
               sh "docker build . "
            }
        }        
    }
    post {
            success {
                 echo "build success..........! nice sagar you got it"
            }
    }
}