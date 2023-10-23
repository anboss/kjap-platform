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
                    echo "env.GIT_USER"
                    //snykscan(${projectName}, env.GIT_USER)

                    sh '''
                    python -m pip install parseGitUrl
                    R=$(python -c 'import parseGitUrl; parseGitUrl.extract("https://gitlab.com/anboss/gitlab-dde.git")')
                    echo $R
                    '''

                }
            }
        }
    }
}
