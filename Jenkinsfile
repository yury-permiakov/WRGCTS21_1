@Library('piper-lib-os') _

pipeline{
    agent any
    stages{
        stage ('Setup') {
        steps        {
            setupCommonPipelineEnvironment(
                collectTelemetryData: 'false',
                verbose: 'false',
                script: this
            )
        }
    }    
    }
    
}
