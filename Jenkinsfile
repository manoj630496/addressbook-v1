pipeline {
    agent any

    parameters{
        string(name:'Env',defaultValue:'Test',description:'environment to deploy')
        booleanParam(name:'executeTests',defaultValue: true,description:'decide to run tc')
        choice(name:'APPVERSION',choices:['1.1','1.2','1.3'])
    }
    stages {
        stage('Compile') {
            steps {
                echo "Compiling the code in ${params.Env}"
            }
        }
    
        stage('Code review') {
            steps {
                echo 'Reviewing the code with pmd'
            }
        }
        stage('UnitTest') {
            when{
                expression{
                    params.executeTests == true
                }
            }
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
                echo "Packaging the code ${params.APPVERSION}"
            }
        }
    
        stage('Publish') {
            steps {
                echo 'Publishing the Artifact'
            }
        }
    }
}
