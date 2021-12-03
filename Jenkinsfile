@Library('piper-lib-os') _

pipeline{
    agent any
    stages{
        stage ('Setup') {
            steps        {
                setupCommonPipelineEnvironment script: this            
            }
            stage('Deploy Commit')
            {
                gctsDeploy script: this
            }            
    }    
    }    
}
