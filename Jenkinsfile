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
                    script
                    {
                        checks_failed  = false
                        try
                        {
                            gctsExecuteABAPUnitTests script: this       
                        } catch (err)
                        {
                            unstable('AUnit test failed!')
                            checks_failed = true
                        }
                    }                    
                }
        }
        stage('Rollback Commit')
        {
            when { expression { checks_failed == true } } 
                steps
                {
                    gctsRollback script: this
                }
        }                
    }    
}
