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
                junit '**/target/surefire-reports/TEST-*.xml'
                echo 'Testing done..'
            }
        }
        stage('build') {
            steps {
                sh 'mvn clean package -Dmaven.test.skip=true'
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