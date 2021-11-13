pipeline {
    agent any

    tools{
        maven 'maven-3.8'
    }
    stages{
        stage ('build') {
             sh 'mvn clean package' 
             junit '**/target/surefire-reports/TEST-*.xml'
             //archiveArtifacts '**/target/
        }
        stage('docker login') { 
            environment { 
                DOCKER_HUB_LOGIN = credentials('docker-hub') 
            } 
            steps { 
                sh 'docker login --username=$DOCKER_HUB_LOGIN_USR --password=$DOCKER_HUB_LOGIN_PSW' 
                } 
        }
        stage ('Push Docker image'){
            sh "docker build -t sagar271992/petclinic:latest . "
            sh "docker push sagar271992/petclinic:latest"
            sh "docker logout"
        }
    }
}