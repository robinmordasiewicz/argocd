# argocd

https://github.com/argoproj/argo-cd/blob/master/docs/getting_started.md

https://www.youtube.com/watch?v=MeU5_k9ssrs

kubectl create namespace argocd

kubectl config set-context --current --namespace=ves-system

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo

kubectl config set-context --current --namespace=argocd

kubectl config get-contexts -o name

argocd cluster add r-mordasiewicz-appstack-site

argocd app create nginx --repo https://github.com/robinmordasiewicz/argocd.git --path nginx --dest-server https://kubernetes.default.svc --dest-namespace r-mordasiewicz --self-heal --sync-policy automated

argocd app set nginx --sync-policy automated

argocd app get nginx

argocd app sync nginx

argocd app set jenkins --helm-version v3

argocd app create jenkins --repo https://github.com/robinmordasiewicz/argocd.git --path jenkins --dest-server https://kubernetes.default.svc --dest-namespace r-mordasiewicz --self-heal --sync-policy automated

argocd app set jenkins --values values.yaml

argocd app set jenkins --sync-policy automated

argocd repo add https://charts.jenkins.io --type helm --name jenkinsci

argocd app get jenkins
