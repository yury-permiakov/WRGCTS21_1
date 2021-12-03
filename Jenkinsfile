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
        stage ('Run ATC Checks')
        {
            steps
            {
                script
                {
                    //try
                    //{
                        abapEnvironmentRunATCCheck script: this
                        def checkStyle = scanForIssues tool: checkStyle(pattern: 'ATCResults.xml')
                        publishIssues issues: [checkStyle], failedTotalAll: 1
                    if ( currentBuild.result == 'FAILURE' )
                    {
                        echo 'ATC failed'
                        checks_failed = true
                    }
//                    } catch (err)//
                    //{
                     //   def checkStyle = scanForIssues tool: checkStyle(pattern: 'ATCResults.xml')
                      //  publishIssues issues: [checkStyle], failedTotalAll: 1
                       // unstable('ATC check failed')
                       // checks_failed = true
                   // }
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
        stage('Success build')
        {
            when { expression { checks_failed == false } }
                steps
                {
                    echo 'Build success!'
                }
        }
    }    
}
