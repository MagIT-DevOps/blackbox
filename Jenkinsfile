pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
                withCredentials([file(credentialsId: 'gpg-secret', variable: 'KEY')]) {
                        sh 'gpg --import "$KEY"'
                        //sh "blackbox_postdeploy"
                        sh "blackbox_cat secret.yml.gpg"
                    }
            }
        }
    }
}