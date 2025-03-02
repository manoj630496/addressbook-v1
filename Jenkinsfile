pipeline {
    agent any

    tools{
        maven 'mymaven'
    }

    parameters{
        string(name:'Env',defaultValue:'Test',description:'environment to deploy')
        booleanParam(name:'executeTests',defaultValue: true,description:'decide to run tc')
        choice(name:'APPVERSION',choices:['1.1','1.2','1.3'])
    }
    stages {
        stage('Compile') {
            steps {
                script{
                echo "Compiling the code in ${params.Env}"
                sh "mvn compile"
            }
            }
        }
    
        stage('Code review') {
            steps {
                script{
                echo 'Reviewing the code with pmd'
                sh "mvn pmd:pmd"
            }
            }
        }
        stage('UnitTest') {
            when{
                expression{
                    params.executeTests == true
                }
            }
            steps {
                
                script{
                echo 'Testing the code using JUnit'
                sh "mvn test"
            }
            }
        }
    
        stage('Coverage Analysis') {
            steps {
                script{
                echo 'Static code coverage with JACOCO'
                sh "mvn verify"
            }
            }
        }
    
        stage('Package') {
            steps {
                script{
                echo "Packaging the code ${params.APPVERSION}"
                sh "mvn package"
            }
            }
        }
    
        stage('Publish') {
            input{
                message "Select the Platform to deploy"
                ok "Platformm selected."
                submitter "Manoj"
                parameters {
                    choice(name: 'NEWAPP', choices: ['EKS','EC2','ON-PREMISE'])
                }
            }
            steps {
                script{
                echo 'Publishing the Artifact to JFROG'
                sh "mvn -U deploy -s Settings.xml"
            }
            }
        }
    }
}
