pipeline {
    agent {
        node {
            label "AGENT-1"
        }
    }
    environment {
        PROJECT = "roboshop"
        COMPONENT = "catalogue"
    }
    options {
        timeout(time: 10, unit: 'MINUTES')
        disableConcurrentBuilds()
    }

}