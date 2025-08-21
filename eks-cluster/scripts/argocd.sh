#!/bin/bash

#### Create and configure aps in Argo CD
#updating the cluster
aws eks update-kubeconfig --name $CLUSTER_NAME
echo "Port forwarding ArgoCD"
kubectl port-forward svc/argocd-server 8080:443 -n argocd 2>/dev/null &

echo "Waiting for port forwarding to be ready..."
sleep 5

echo "Set the ArgoCD logon credentials"
ARGOCD_SERVER_ADDRESS="localhost:8080"
ARGOCD_ADMIN_PASSWORD=$(argocd admin initial-password -n argocd | grep -oE '[[:alnum:]-]{16}')
argocd login "$ARGOCD_SERVER_ADDRESS" --insecure --username admin --password "$ARGOCD_ADMIN_PASSWORD"

# create a file with argocd credentials
echo "If Argocd Isnt Running , 'kubectl port-forward svc/argocd-server 8080:443 -n argocd &' in a new terminal" > argocd-credentials.txt
echo "Argocd Url: https://localhost:8080" >> argocd-credentials.txt
echo "Username: admin" >> argocd-credentials.txt
echo "Password : $ARGOCD_ADMIN_PASSWORD" >> argocd-credentials.txt
echo "########################################"

# ######### ADDING THE REPO ##########
echo "Adding the gitops repo to ArgoCD"
argocd repo add $REPO_URL --username $REPO_USERNAME --password $REPO_PASSWORD --name $REPO_NAME --project default

######### ADDING THE CLUSTER #############
aws eks update-kubeconfig --name $CLUSTER_NAME
kubectl config set-context --current --namespace=argocd
argocd cluster add $CLUSTER_NAME_CONTEXT | echo "yes"


echo "Deploy or update all the apps using argocd app-of-apps"
if argocd app get "$APP_NAME" >/dev/null 2>&1; then
    echo "Updating existing Argo CD application: $APP_NAME"
    argocd app create --upsert --file "$APP_YAML_PATH"
else
    echo "Creating new Argo CD application: $APP_NAME"
    argocd app create --file "$APP_YAML_PATH"
fi






