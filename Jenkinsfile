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

                    regex = r"([a-z]+):\/\/([^/]*)\/([^/]*)\/(.*)\.git"

                    test_str = "https://gitlab.com/example/test_backend.git"

                    matches = re.finditer(regex, test_str, re.MULTILINE)

                    for matchNum, match in enumerate(matches, start=1):
    
                    print ("Match {matchNum} was found at {start}-{end}: {match}".format(matchNum = matchNum, start = match.start(), end = match.end(), match = match.group()))
    
                    for groupNum in range(0, len(match.groups())):
                    groupNum = groupNum + 1
        
                    print ("Group {groupNum} found at {start}-{end}: {group}".format(groupNum = groupNum, start = match.start(groupNum), end = match.end(groupNum), group = match.group(groupNum)
                                echo "Namespace : ${name_space}" 
                }
            }
        }
    }
}
