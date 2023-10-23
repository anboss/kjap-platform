@Library('my-shared-library') _

import re

pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "MyMaven"
    }

    stages {
        stage('Build') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/anboss/kjap-platform.git'

                // Run Maven on a Unix agent.
                sh "mvn -Dmaven.test.failure.ignore=true clean package"

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }

            post {
                // If Maven was able to run the tests, even if some of the test
                // failed, record the test results and archive the jar file.
                success {
                    junit '**/target/surefire-reports/TEST-*.xml'
                    archiveArtifacts 'target/*.jar'
                }
            }
        }
        stage('Snyk Scan'){
            steps{
                script {
                    def projectName= env.GIT_URL.replaceFirst(/^.*\/([^\/]+?).git$/, '$1')
                    echo "Project Name: ${projectName}"
                    //snykscan(${projectName})

                    def matches = re.search(r''([a-z]+):\\/\\/([^/]*)\\/([^/]*)\\/(.*)\\.git'', env.GIT_URL)
                    def name_space = matches.group(3)
                    echo "Namespace : ${name_space}" 
                }
            }
        }
    }
}
