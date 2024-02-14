pipeline{
    agent any

    stages('build'){
        step{
            go build -o app
            ./app
        }
    }
}