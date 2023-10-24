@Library('my-shared-library') _

pipeline {
    agent any
    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "MyMaven"
    }
    environment {
        GIT_USER = 'anboss'
    }
    stages {
        stage('Snyk Scan'){
            steps{
                script {
                    def projectName= env.GIT_URL.replaceFirst(/^.*\/([^\/]+?).git$/, '$1')
                    echo "Project Name: ${projectName}"
                    echo "env.GIT_USER"
                    snykscan(projectName, env.GIT_USER)
               }
            }
        }
        stage('Build') {
            steps {
                git 'https://github.com/anboss/kjap-platform.git'
                sh "mvn -Dmaven.test.failure.ignore=true clean package"
            }
            post {
                success {
                    junit '**/target/surefire-reports/TEST-*.xml'
                    archiveArtifacts 'target/*.jar'
                }
            }
        }
    }
}
