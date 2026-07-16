pipeline {
    agent {
        node {
            label "AGENT-1"
        }
    }
    environment {
        PROJECT = "roboshop"
        COMPONENT = "catalogue"
    // Keeping this appVersion for defining the variable value from a read function with def keyword as packageJSON
        appVersion = ""
    }
    options {
        timeout(time: 10, unit: 'MINUTES')
        disableConcurrentBuilds()
    }
    stages {
        stage ("Build") {
            steps {
                script {
                    // Reading the package.json file using readJSON function and assigning it to packageJSON using def
                    def packageJSON = readJSON 'package.json'
                    sh """ echo packageJSON """
                    //appVersion = packageJSON.version
                }
            }
        }
    }
}