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
        // appVersion = ""
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
                    def packageJSON = readJSON file: 'package.json'
                    // Assigning the packageJSON.version to a variable called appVersion to fetch the version from the file
                    appVersion = packageJSON.version
                    echo "The app version is: ${appVersion}"
                }
            }
        }
        stage ("Push ")
    }
}