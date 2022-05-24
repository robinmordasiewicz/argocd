# argocd

kubectl create secret docker-registry regcred --docker-server=https://index.docker.io/v1/ --docker-username=<username> --docker-password='<password>' --docker-email='<email>' --namespace <namespace>

https://github.com/argoproj/argo-cd/blob/master/docs/getting_started.md

https://www.youtube.com/watch?v=MeU5_k9ssrs

kubectl create namespace argocd

kubectl config set-context --current --namespace=ves-system

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo

kubectl config set-context --current --namespace=argocd

kubectl config get-contexts -o name

kubectl get pods,svc -n argocd -o wide

argocd login 100.127.193.34

argocd cluster add r-mordasiewicz-appstack-site

argocd app create nginx --repo https://github.com/robinmordasiewicz/argocd.git --path nginx --dest-server https://kubernetes.default.svc --dest-namespace r-mordasiewicz --self-heal --sync-policy automated

argocd app set nginx --sync-policy automated

argocd app get nginx

argocd app sync nginx

-------

argocd repo add https://charts.jenkins.io --type helm --name jenkinsci

argocd app create jenkins --repo https://github.com/robinmordasiewicz/argocd.git --path jenkins --dest-server https://kubernetes.default.svc --dest-namespace r-mordasiewicz --self-heal --sync-policy automated --helm-version v3 --values values.yaml 

argocd app set jenkins --helm-version v3

argocd app set jenkins --values values.yaml

argocd app set jenkins --sync-policy automated

argocd app get jenkins

kubectl get applications -n argocd


---------------------------

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj-labs/argocd-image-updater/stable/manifests/install.yaml

kubectl describe pod -n r-mordasiewicz jenkins-0

kubectl logs -n r-mordasiewicz jenkins-0 -c jenkins

kubectl get pods -n r-mordasiewicz
kubectl describe pod nginx-56d9bf85b4-xtwjc -n r-mordasiewicz


