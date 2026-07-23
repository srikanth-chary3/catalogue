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
        ACC_ID = "173237057266"
    }
    options {
        timeout(time: 10, unit: 'MINUTES')
        disableConcurrentBuilds()
    }
    stages {
        stage ("checkout") {
            steps {
                echo "Checkout SCM"
            }
        }
        stage ("Install Dependencies") {
            steps {
                script {
                    sh """
                        npm install
                    """
                }
            }
        }
        stage ("Unit test") {
            steps {
                script {
                    sh """
                        npm test
                    """
                }
            }
        }
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
        stage ("Push "){
            steps {
                script {
                    withAWS(region:'us-east-1',credentials:'aws-creds') {
                        //before these steps, we should be logged in to the docker from the master
                        sh """
                        aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ${ACC_ID}.dkr.ecr.us-east-1.amazonaws.com
                        docker build -t ${ACC_ID}.dkr.ecr.us-east-1.amazonaws.com/${PROJECT}/${COMPONENT}:${appVersion} .
                        docker images
                        docker push ${ACC_ID}.dkr.ecr.us-east-1.amazonaws.com/${PROJECT}/${COMPONENT}:${appVersion}
                        """
                    }
                }
            }
        }
    }
    post {
        always {
            echo "I will print on each pipeline build"
        }
        success {
            echo "The build is a success..!"
        }
        failure {
            echo "The build is a failure..!"
        }
    }
}
