pipeline {
    agent any
    tools{
        maven 'maven'
       // dockerTool 'docker'
    }
    stages {
//         stage('Clone') {
//             steps {
//                 git branch: 'main', credentialsId: 'jenkin_token', url: 'https://github.com/psycho-0609/test-jenkin.git'
//             }
//         }

        stage('build maven'){
            steps{
                sh 'java --version && mvn --version'
                sh 'mvn clean package -Dmaven.test.failure.ignore=true'
                sh 'docker --version'
                sh 'ls'
            }
        }
//         stage('run application'){
//             steps{
//                 sh 'java -jar target/spring-application-0.0.1-SNAPSHOT.jar'
//             }
//         }
//           stage('Docker Build and Tag') {
//                    steps {

//                         sh 'docker build -t springboot:latest .'
//                           sh 'docker tag springboot hungln0609/springboot:latest'
// //                         sh 'docker tag springboot hungln0609/springboot:$BUILD_NUMBER'

//                   }
//                 }

        stage('Packing/Pushing image'){
            steps{
                script{
                    withDockerRegistry([credentialsId: 'dockerhub', url : '']){
                      sh 'docker build -t hungln0609/springboot'
                      sh 'docker push -t hungln0609/springboot:latest'
                  }
                }
                  
            }
        }
    }
}
