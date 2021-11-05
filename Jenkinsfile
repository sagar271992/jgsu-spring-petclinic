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
               sh "docker build -t petclinic:v1.0.0 . "
               withCredentials([gitUsernamePassword(credentialsId: 'dockerhub', gitToolName: 'Default')]) {
                // sh "docker tag petclinic dockerhub/petclinic:v1.0.0"
                // sh "ocker commit petclinic dockerhub/petclinic:v1.0.0"
                // sh "docker push dockerhub/petclinic:v1.0.0"
                sh "docker tag petclinic:v1.0.0 sagar271992/petclinics:latest"
                sh "docker push sagar271992/petclinics:latest"
               }
            }
        }        
    }
    post {
            success {
                 echo "build success..........! nice sagar you got it"
            }
    }
}