pipeline {
    agent any

    stages {
        stage ('build') {
            step {
                go build -o app
                ./app
            }
        }
    }
  /}