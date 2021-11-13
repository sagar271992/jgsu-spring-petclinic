pipeline{
    agent any

    tools {
        jdk 'jdk-8'
        maven 'maven-3.8'
    }
    
    stages{
        stage("build"){
            steps{
               withMaven (maven 'maven-3.8') {
                   sh "mvn clean package"
               }
            }
        }
        stage ("docker build") {
            steps{
                sh "docker build -t sagar271992/petclinic:latest ."
            }
        }
       stage('Docker Publish') {
           steps {
               withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                   sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                   sh 'docker push sagar271992/petclinic:latest'
                }
            }
        }
        stage('Docker Publish') {
           steps {
               withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                   sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                   sh 'docker push sagar271992/petclinic:latest'
                }
            }
        }
        stage('deploy'){
            steps {
                sh "kubectl --kubeconfig=/home/sagar/.kube/config apply -f ./k8s/deployment.yaml"
                sh "kubectl --kubeconfig=/home/sagar/.kube/config apply -f ./k8s/service.yaml"
            }
        }

    }

}
