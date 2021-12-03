@Library('piper-lib-os') _

pipeline{
    agent any
    stages
    {
        stage ('Setup') 
        {
                steps
                {  
                    setupCommonPipelineEnvironment script: this            
                }
        }
        stage('Deploy Commit')
        {
                steps
                {
                    gctsDeploy script: this
                }
        }     
        stage('Run Unit Tests')
        {
                steps
                {
                    gctsExecuteABAPUnitTests script: this
                }
        } 
        stage('Rollback Commit')
        {
                steps
                {
                    Rollback script: this
                }
        }         
    }    
}
