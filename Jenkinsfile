pipeline{
    agent any

    tools {
        jdk 'jdk-8'
        maven 'maven-3.8'
    }
    
    stages{
        stage("build"){
            steps{
               withMaven (maven:'maven-3.8') {
                   sh "mvn clean package"
               }
            }
        }
        stage ("docker build") {
            steps{
                sh "docker build -t sagar271992/petclinic:'${env.BUILD_NUMBER}' ."
            }
        }
     
        stage('Docker Publish') {
           steps {
               withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                   sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                   sh "docker push sagar271992/petclinic:'${env.BUILD_NUMBER}' "
                }
            }
        }
        stage('deploy'){
            steps {
                echo "home: $HOME &  user: $USER"
                sh "chmod 770 ./k8s/*.yaml"
                sh "kubectl --kubeconfig=$HOME/.kube/config apply -f ./k8s/deployment.yaml"
                
                // sh "kubectl --kubeconfig=$HOME/.kube/config apply -f ./k8s/external-service.yaml"
                
                sh "kubectl --kubeconfig=$HOME/.kube/config apply -f ./k8s/internal-service.yaml"
                sh "kubectl --kubeconfig=$HOME/.kube/config apply -f ./k8s/ingress.yaml"

            }
        }

    }

}
