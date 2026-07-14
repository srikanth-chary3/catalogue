pipeline {
    agent {
        node {
            label "AGENT-1"
        }
    }
    environment {
        COURSE = "Jenkins"
        appVersion = ""
        username = "srikanthsuthari"
        password = "srikanth@12345"
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
        stage ("Build") {
            steps {
                echo "Building docker image"
                script {
                    sh """
                    docker build -t srikanthsuthari/catalogue:${appVersion} .
                    docker images
                    docker login -u ${username} -p ${password}
                    docker push
                    """
                    // docker push -u srikanthsuthari -p srikanth@12345
                }
                // echo ${appVersion}
            }
        }
    }
}