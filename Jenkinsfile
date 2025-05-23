pipeline {
    // The agent block specifies where (on which node or agent) the pipeline or stage should run.
    agent {
        label 'AGENT-1'
    }
    // the options block is used to configure various pipeline-level behaviors.
    options {
        timeout(time: 30, unit: 'MINUTES') // If the pipeline runs for more than 30 minutes, Jenkins will terminate it.
        disableConcurrentBuilds() // If a build is already running and another one is triggered, the new one will wait or fail(based on trigger configuration)
    }
    // The parameters block allows you to define build-time input options, so users can provide values before the pipeline starts.
    parameters {
        string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
        text(name: 'BIOGRAPHY', defaultValue: '', description: 'Enter some information about the person')
        booleanParam(name: 'TOGGLE', defaultValue: true, description: 'Toggle this value')
        choice(name: 'CHOICE', choices: ['One', 'Two', 'Three'], description: 'Pick something')
        password(name: 'PASSWORD', defaultValue: 'SECRET', description: 'Enter a password')
    }
    // The environment block is used to define environment variables that will be available to all stages and steps within the pipeline.
    environment{
        DEPLOY_TO =  'production'
        GREETING = 'Good Morning'
    }
    stages {
        stage('Build') {
            steps {
                sh 'echo This is build'
                sh 'env'
            }
        }
        stage('Test') {
            steps {
                sh 'echo This is Test'
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo This is Deploy'
            }
        }
        stage("print params"){
            steps{
                echo "Hello ${params.PERSON}"
                echo "Biography: ${params.BIOGRAPHY}"
                echo "Toggle: ${params.TOGGLE}"
                echo "Choice: ${params.CHOICE}"
                echo "Password: ${params.PASSWORD}"
                echo "triggered test again"
                error 'some failure'
            }
        }
    }
    // The post block is used to define actions that should run after the main pipeline execution, depending on its result.
    post { 
        always { 
            echo 'I will always say Hello again!'
        }
        success { 
            echo 'I will run when pipeline is success'
        }
        failure { 
            echo 'I will run when pipeline is failure'
        }
    }
}