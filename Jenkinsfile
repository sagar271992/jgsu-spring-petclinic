pipeline {
    agent any
    tools {
         maven 'maven-3.8'
    }
    stages {
        // stage('compile') {
        //     steps {
        //         sh 'mvn -v'
        //         sh 'mvn compile'
        //     }
        // }
        
        // stage('Test') {
        //     steps {
        //         sh 'mvn test'
        //         junit '**/target/surefire-reports/TEST-*.xml'
        //         echo 'Testing done..'
        //     }
        // }
        stage('build') {
            steps {
                sh 'mvn clean package -Dmaven.test.skip=true'
                archiveArtifacts 'target/*.jar'
            }
        }
        stage('deploy') {
            steps {
               sh "docker build -t sagar271992/petclinic:latest . "
               withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub',usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) 
                echo
                echo "username: ${usernameVariable} -  password: ${PASSWORD}"
                echo
                sh "docker login -u ${usernameVariable} -password ${PASSWORD} "
                // sh "docker tag petclinic sagar271992/petclinic:latest"
                echo ""
                sh "docker push sagar271992/petclinic:latest"
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
