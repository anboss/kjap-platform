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
        // stage('Snyk Scan'){
        //     steps{
        //         script {
        //             def projectName= env.GIT_URL.replaceFirst(/^.*\/([^\/]+?).git$/, '$1')
        //             echo "Project Name: ${projectName}"
        //             echo "env.GIT_USER"
        //             snykscan(projectName, env.GIT_USER)
        //        }
        //     }
        // }
        stage('Build') {
            steps {
                git 'https://github.com/anboss/kjap-platform.git'
				git checkout feature/snyk
                sh "mvn -Dmaven.test.failure.ignore=true -DskipTests=true clean package"
            }
            // post {
            //     success {
            //         junit '**/target/surefire-reports/TEST-*.xml'
            //         archiveArtifacts 'target/*.jar'
            //     }
            // }
        }
		stage('Build Image') {
			steps {
				sh 'docker build -t ananth2kannan/kjap-platform C:/ProgramData/Jenkins/.jenkins/workspace/MyMBP_feature_snyk'
			}
		}
    }
}
