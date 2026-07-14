pipeline {
    agent {
        node {
            label "AGENT-1"
        }
    }
    environment {
        COURSE = "Jenkins"
    }
    options {
        timeout (time: 10, unit: "MINUTES")
        disableConcurrnetBuilds()
    }

    
}