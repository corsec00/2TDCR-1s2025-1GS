Clear-Host
# Correção da prova
# Variáveis
$resourceGroup = "rg-fiapGS"
$location = "eastus"
$DockerResposta = "metasploit-thor"
$aksName = "aks-metasploitgs"
# Fornecido pelo aluno
$dockerImage = "metasploitacrthor.azurecr.io/metasploit-kali:v1"
$GitHubRepo = "https://github.com/totsxyy/metasploit-cloud"


$lastSegment = $GitHubRepo.Split("/")[-1]
Write-Output $lastSegment


# Roda o Docker local para verificar a integridade e funcionamento
git clone $GitHubRepo 
cd $lastSegment
docker build -t $DockerResposta .
docker run -it $DockerResposta

# Roda o ACR para verificar se está disponível
docker build -t $dockerImage .
docker run -it $dockerImage

cd ..
Clear-Host
# Login no Azure
az login

# Criar Resource Group
az group create --name $resourceGroup --location $location

# Criar AKS e vincular ao ACR
az aks create --resource-group $resourceGroup --name $aksName --node-count 1 --generate-ssh-keys 

# Obter credenciais do AKS
az aks get-credentials --resource-group $resourceGroup --name $aksName

# Criar arquivo de deployment YAML
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

# Aplicar o deployment no AKS
kubectl apply -f metasploit-deployment.yaml

# Executar Metasploit no AKS

kubectl exec -it $(kubectl get pods -l app=metasploit -o jsonpath="{.items[0].metadata.name}") -- msfconsole

az group delete --name $resourceGroup --yes --no-wait
