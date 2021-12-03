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
                steps{
                    gctsDeploy script: this
                }
            }            
    }    
    }    
}
