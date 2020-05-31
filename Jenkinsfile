node {
    stage ('checkout') {
        git changelog: false, poll: false, url: 'https://github.com/YuliyaYemelyanovich/ci-practice'
    }
    withEnv(['PATH+EXTRA=/usr/local/go:/usr/local/go/bin:$PATH']) {
        parallel 
            build: {
                stage('Build') {
                    sh 'make build'
                }
            },
            test: {
                stage('Test') {
                    sh 'make test'
            }
        }
    }
    stage('Results') {
       archiveArtifacts 'coverage.out'
    }
}
