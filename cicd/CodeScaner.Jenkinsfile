node {
  stage('SCM') {
    checkout scm
  }
  stage('Select JDK Version') {
    env.JAVA_HOME="${tool 'JDK16'}"
    env.PATH="${env.JAVA_HOME}/bin:${env.PATH}"
    sh 'java -version'
  }
  stage('SonarQube Analysis') {
    withSonarQubeEnv() {
      sh "gradle codeCoverageReport"
      sh "gradle sonarqube"
    }
  }
}