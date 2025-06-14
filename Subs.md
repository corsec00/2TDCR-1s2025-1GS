# GS FINALIZADA
## Respostas não são mais aceitas

Aluno elegível: RM556874<br />
Matéria: CLOUD SECURITY (APPSEC And DEVSECOPS)<br />
Professor: Leonardo Santos Silva<br />
Prazo para a entrega: 13/Jun/2025 - 21:00 <br />
Envio da Resposta: Contato direto com o Professor via MS Teams<br />
Total: 10 Pts<br />

 
 ## MetaSploit de qualquer lugar!

O [Metasploit](https://www.metasploit.com) é uma ferramenta poderosa (e perigosa) que pode ser usada para explorar e atacar sistemas remotos. Entretanto, vc precisa ter contigo uma VM ou um computador físico com ele instalado (ou com o KALI) toda vez que quiser usá-lo.<br />
Ao escutar a reclamação deste problema dos seus colegas, vc teve uma ideia: E se instala-lo via Containers e executa-lo via Kubernetes, para que seja acessível de qualquer lugar?<br />
Esta é a sua tarefa! <br />



#### DICAS:

Não há problema em usar mecanismos de IA para as tarefas. Mas lembre-se, se a IA alucinar ou fornecer respostas erradas, quem perde pontos é vc.<br />
Use linhas de comando (Azure CLI). Isso faz com que o trabalho ande rápido e mais eficiente. Se quiser, inclua um arquivo PS1 no seu repositório para validar o progresso na execução das atividades.<br />
Verifique se os recursos (Github e ACR) estejam disponíveis para a validação. Se não conseguir acessá-los, não conseguirei validar e pontuar. 

## Parte 1 (3 pts)
a. Crie um Dockerfile para que o Metasploit seja instalado automaticamente (dica: use o ambiente do Kali para isso).<br />
b. Crie um Docker para que este script possa ser executado dentro de um ambiente contenerizado.<br />
c. Submeta estes arquivos para um repositório do GitHub e compartilhe o link (github.com/seu-usuario/seu-projeto.git) como resposta desta questão.<br />
<br />
Como será validado esta questão:<br />
Será feito um clone do seu repositório e o container será construído na máquina do professor.<br />
2 pts - Build completo do Container sem erros (cada erro que eu precisar corrigir, descontarei 1 pt, até o limite de 3 erros, quando esta parte será invalidada).<br />
1 pts - Execução do ```msfconsole```<br />
<br />
Certifique-se de que o seu script funciona dentro do Docker antes de submeter no Github.<br />

## Parte 2 (3 pts)
Suba o container em um Azure Container Registry (ACR) no seu ambiente Azure.<br />
Informe a URL completa do ACRLoginServer do ACR, o nome do repositório e a Tag do container.<br />
<br />
Como será validado esta questão:<br />
Executarei o seguinte comando para validar a entrega: ```docker run -it $loginserver/$acrRepo```<br />
2 pts - Consegui acessar a aplicação (ATENÇÃO: antes de submeter, certifique-se que é possível acessar o repositório sem a necessidade de login; Peça para algum colega testar antes ou teste de maneira anônima --> ```az logout```). Só apague o ACR depois do Ok do professor.<br />
1 pt  - Execução do ```msfconsole```.<br />
<br />

## Parte 3 (4 pts)
Execute o seu Container em um Cluster AKS<br />
Envie o arquivo YAML e submeta ao Github (ver Parte 1).<br />
<br />
Como será validado esta questão:<br />
Executarei os seguintes passos para validar a entrega. <br />
2 pts - Usarei o seu ACR (Público e com autenticação anônima) para subir o meu Cluste AKS<br />
1 pt  - Usarei o seu YAML para configurar o meu Cluster AKS ```kubectl apply -f SEU_METASPLOIT.yaml```
1 pts - Execução do ```msfconsole``` por meio do comando ```kubectl exec -it <MEU_POD_AKS> -- /bin/bash```<br />
<br />
Obs: <br />
a. Mantenha ACR ativo até que eu possa validar. <br />
b. Certifique-se que seu ACR esteja com o acesso público e sem exigir autenticação para os testes. <br />
c. Depois de testar o seu AKS e certificar-se que funciona no seu ambiente, pode apagar este recurso. 
