# Cloud-Native-Monitoring-app
This Repo contains the Flask monitoring app code and python script to create resource, Terraform scripts to create EKS cluster and also Github Actions YAML file

Create EKS cluster
cd terraform
change the variable name according to you and already setup the aws creds
connect to cluster

setup argo cd
https://github.com/argoproj/argo-helm/tree/main/charts/argo-cd#installing-the-chart
https://helm.sh/docs/intro/install/
change the deployment type to nodeport and then build a application for this ou can refer this video https://youtu.be/ZgJQG475oME?si=g1O6RzFQQh1XRtvj

changes to the github action file 
secrets and your ecr repo name


