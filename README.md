# argocd

https://github.com/argoproj/argo-cd/blob/master/docs/getting_started.md

https://www.youtube.com/watch?v=MeU5_k9ssrs

kubectl create namespace argocd

kubectl config set-context --current --namespace=ves-system

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo

kubectl config get-contexts -o name

argocd cluster add r-mordasiewicz-appstack-site
