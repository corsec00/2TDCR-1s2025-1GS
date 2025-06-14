Clear-Host
# Correção da prova
# Autor: Leonardo Santos Silva
# Data: 14/jun/2025
# Fornecido pelo aluno - Deve ser incluido manualmente
# ------------- BEGIN -------------
$dockerImage = "<NOME_DO_ACR>.azurecr.io/<NOME_DO_REPO>:<TAG>"
$GitHubRepo = "https://github.com/<ALUNO>/<REPO>"
# ------------- END -------------
$resourceGroup = "rg-fiapGS"
$location = "eastus"
$DockerResposta = "metasploit-thor"
$aksName = "aks-metasploitgs"
$lastSegment = $GitHubRepo.Split("/")[-1]
Write-Output $lastSegment
git clone $GitHubRepo 
cd $lastSegment
docker build -t $DockerResposta .
docker run -it $DockerResposta
docker build -t $dockerImage .
docker run -it $dockerImage
cd ..
Clear-Host
# Ambiente Azure
az login
az group create --name $resourceGroup --location $location
az aks create --resource-group $resourceGroup --name $aksName --node-count 1 --generate-ssh-keys 
az aks get-credentials --resource-group $resourceGroup --name $aksName
$deploymentYaml = @"
apiVersion: apps/v1
kind: Deployment
metadata:
  name: metasploit-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      app: metasploit
  template:
    metadata:
      labels:
        app: metasploit
    spec:
      containers:
      - name: metasploit
        image: $dockerImage
        imagePullPolicy: Always
        tty: true
        stdin: true
        command: ["/bin/bash"]
      imagePullSecrets:
      - name: acr-secret
---
apiVersion: v1
kind: Service
metadata:
  name: metasploit-service
spec:
  type: LoadBalancer
  selector:
    app: metasploit
  ports:
    - port: 4444
      targetPort: 4444
      protocol: TCP
"@
$deploymentYaml | Out-File -Encoding ascii metasploit-deployment.yaml
kubectl apply -f metasploit-deployment.yaml
kubectl exec -it $(kubectl get pods -l app=metasploit -o jsonpath="{.items[0].metadata.name}") -- msfconsole
az group delete --name $resourceGroup --yes --no-wait
