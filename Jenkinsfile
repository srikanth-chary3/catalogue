pipeline {
    agent {
        node {
            label "AGENT-1"
        }
    }
    environment {
        COURSE = "Jenkins"
        appVersion = ""
    }
    options {
        timeout (time: 10, unit: "MINUTES")
        disableConcurrentBuilds()
    }

    // This is build section
    stages {
        stage ("Read Version") {
            steps {
                script {
                    // Defining a variable by reading the package.json file ( This will all the data into packageJSON)
                    def packageJSON = readJSON file: 'package.json'
                    appVersion = packageJSON.version
                    echo "app version is: ${appVersion}"
                }
            }
        }
        stage ("Deploy") {
            steps {
                echo "Deploying"
                // echo ${appVersion}
            }
        }
    }
}