def dockerImageNginx
pipeline {
    agent any
    tools{
        maven 'maven'
        dockerTool 'docker'
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
            }
        }
//         stage('run application'){
//             steps{
//                 sh 'java -jar target/spring-application-0.0.1-SNAPSHOT.jar'
//             }
//         }

        stage('build image'){
                    steps{
                         dockerImageNginx = docker.build registrynginx + ":$BUILD_NUMBER", "-f dockerfilenginx ."
                    }
                }

        stage('Push Image to registry') {
          steps{
            script{
              withDockerRegistry(credentialsId: 'dockerhub', url: '') {
                dockerImageNginx.push()
              }
            }
          }
        }
    }
}
