# GS FINALIZADA
## Respostas não são mais aceitas
<<<<<<< HEAD
.
=======
>>>>>>> 0d100a6a3d370eaadfaac33367869baf93eebd08
## Senha vazada!

Há uma suspeita de alguns diretores de que seus usuários e respectivas senhas foram vazados na internet.<br />
Foi solicitado que vc crie um aplicativo para verificar se de fato, isso acontece e os dois itens estão vazados.<br />
Entretanto, por limitações na política de segurança da empresa, é proibido que vc instale aplicativos. <br />
Então, a instalação de Compiladores como o Python, .NET e outros Frameworks é proibida. <br />
Sobra apenas a possibilidade de uso de Containers, já que o Docker está instalado em suas estações de trabalho. <br />
<br />
Obs:<br />
Não há problema em usar mecanismos de IA para as tarefas. Mas lembre-se, se a IA alucinar ou fornecer respostas erradas, quem perde pontos é vc.<br />
Dica: use linhas de comando (CLI). Isso faz com que o trabalho ande rápido e mais eficiente. <br />

## Parte 1 (7 pts)
a. Crie um script em Python (mais fácil) ou C# (mais difícil) ou outra linguagem familiar para realizar esta tarefa (não use PowerShell).<br />
No mínimo, as consultas deverão ser realizadas nos seguintes mecanismos:<br />
<li>Have I Been Pwned
<li>Mozilla Monitor
<li>Cybernews
<li>F-Secure<br /><br />
b. Crie um Docker para que este script possa ser executado dentro de um ambiente contenerizado<br /><br />
c. Submeta estes arquivos para um repositório do GitHub e compartilhe o link (github.com/seu-usuario/seu-projeto.git) como resposta desta questão.<br />
<br />
Como será validado esta questão:<br />
Será feito um clone do repositório e o container construído na máquina do professor.<br />
3 pts - Build completo<br />
2 pts - Run completo<br />
2 pts - Validação do usuário e senha vazados<br />
<br />
Certifique-se de que o seu script funciona dentro do Docker antes de submeter.<br />

## Parte 2 (3 pts)
Suba o container em um Azure Container Registry (ACR)<br />
Informe a URL completa do ACRLoginServer do ACR, o nome do repositório e a Tag do container.<br />
<br />
Como será validado esta questão:<br />
Executarei o seguinte comando para validar a entrega: ```docker run -it $loginserver/$acrRepo```<br />
2 pts - Conseguiu acessar a aplicação (antes de submeter, certifique-se que é possível acessar o repositório sem a necessidade de login; Peça para algum colega testar antes)<br />
1 pt - Validação do usuário e senha vazados<br />
<br />
Obs: Se dois ACR forem submetidos com o mesmo nome, apenas o primeiro aluno a submeter será considerado na avaliação. O segundo será descartado. 
