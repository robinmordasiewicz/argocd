pipeline {
  options {
    disableConcurrentBuilds()
  }
  triggers {
    upstream(upstreamProjects: "nginx,jenkins", threshold: hudson.model.Result.SUCCESS)
  }
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
    stage('INIT') {
      steps {
        cleanWs()
        checkout scm
      }
    }
    stage('Increment VERSION') {
      steps {
        container('ubuntu') {
          sh 'sh increment-version.sh'
          sh 'sh increment-helm-version.sh'
          sh 'sh increment-nginx-version.sh'
        }
      }
    }
    stage('commit new VERSION') {
      steps {
        sh 'git config user.email "robin@mordasiewicz.com"'
        sh 'git config user.name "Robin Mordasiewicz"'
        sh 'git add .'
        sh 'git tag -a `cat VERSION`'
        sh 'git diff --quiet && git diff --staged --quiet || git commit -m "`cat VERSION`"'
        withCredentials([gitUsernamePassword(credentialsId: 'github-pat', gitToolName: 'git')]) {
          sh 'git diff --quiet && git diff --staged --quiet || git push origin main'
          sh 'git push --tags'
        }
      }
    }
    stage('deploy app') {
      steps {
        withKubeConfig([credentialsId: 'kubeconfig']) {
          container('ubuntu') {
            sh 'kubectl apply -f jenkins.yaml'
            sh 'kubectl apply -f nginx.yaml'
          }
        }
      }
    }
  }
  post {
    always {
      cleanWs(cleanWhenNotBuilt: false,
            deleteDirs: true,
            disableDeferredWipeout: true,
            notFailBuild: true,
            patterns: [[pattern: '.gitignore', type: 'INCLUDE'],
                       [pattern: '.propsfile', type: 'EXCLUDE']])
    }
  }
}
