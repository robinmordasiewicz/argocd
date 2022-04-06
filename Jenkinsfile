pipeline {
  agent {
    kubernetes {
      yaml '''
        apiVersion: v1
        kind: Pod
        spec:
          containers:
          - name: ubuntu
            image: robinhoodis/ubuntu:latest
            command:
            - cat
            tty: true
        '''
    }
  }
  stages {
//    stage('increment-version') {
//      steps {
//        dir ( 'argocd' ) {
//          container('ubuntu') {
//            sh "sh increment-jenkins-version.sh"
//          }
//        }
//      }
//    }
//    stage('commit app repo') {
//      steps {
//        dir ( 'argocd' ) {
//          sh 'git config user.email "robin@mordasiewicz.com"'
//          sh 'git config user.name "Robin Mordasiewicz"'
//          sh 'git add .'
//          sh 'git tag `date +"%y.%m.%d.%H.%M"`'
//          sh 'git commit -m "`date +"%y.%m.%d.%H.%M"`"'
//          withCredentials([gitUsernamePassword(credentialsId: 'github-pat', gitToolName: 'git')]) {
//            sh '/usr/bin/git push origin main'
//            sh '/usr/bin/git push origin `date +"%y.%m.%d.%H.%M"`'
//          }
//        }
//      }
//    }
    stage('deploy app') {
      steps {
        withKubeConfig([credentialsId: 'kubeconfig']) {
          container('ubuntu') {
            sh 'kubectl apply -f argocd/jenkins.yaml'
            sh 'kubectl apply -f argocd/nginx.yaml'
          }
        }
      }
    }
  }
//  post {
//    always {
//      cleanWs(cleanWhenNotBuilt: false,
//            deleteDirs: true,
//            disableDeferredWipeout: true,
//            notFailBuild: true,
//            patterns: [[pattern: '.gitignore', type: 'INCLUDE'],
//                     [pattern: '.propsfile', type: 'EXCLUDE']])
//    }
//  }
}
