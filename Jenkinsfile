pipeline {
    agent any

    stages {
        stage('Compile') {
            steps {
                echo 'Compiling the code'
            }
        }
    
        stage('Code review') {
            steps {
                echo 'Reviewing the code with pmd'
            }
        }
        stage('UnitTest') {
            steps {
                echo 'Testing the code using JUnit'
            }
        }
    
        stage('Coverage Analysis') {
            steps {
                echo 'Static code coverage with JACOCO'
            }
        }
    
        stage('Package') {
            steps {
                echo 'Packaging the code'
            }
        }
    
        stage('Publish') {
            steps {
                echo 'Publishing the Artifact'
            }
        }
    }
}
