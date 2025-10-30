<h1 align="center"> SPTECH - São Paulo Tech School</h1>

<p align="center">
<a href= "https://sptech.school/"><img src="Aplicação Web/public/assets/imagens/logo2.PNG" alt="SPTECH - São Paulo Tech School" border="0" width=40% height=40%></a>
</p>

<br>

# Mediway

## 👨‍🎓 Integrantes: 
- <a href="https://www.linkedin.com/in/igor-felix-26ab13191/">Igor Alexandro Felix Cardoso 01252072</a>
- <a href="https://www.linkedin.com/in/marina-yuri-okamoto-6472b737b/">Marina Yuri Okamoto 01252051</a>
- <a href="www.linkedin.com/in/rafael-alexandre-848a61299">Rafael Alexandre da Silva 01252</a> 
- <a href="https://www.linkedin.com/in/jamilly-lima-872895252/">Ronijamilly de Souza Lima 01252117</a> 
- <a href="https://www.linkedin.com/company/inova-fusca">Victor Rafael Lourenço Oliveira 01252058</a>
- <a href="https://www.linkedin.com/in/vinigama/">Vinícius de Santana Gama 01252087</a>

## 👩‍🏫 Professores:
### Tutor(a) 
- <a href="https://www.linkedin.com/in/claudio-frizzarini/">Claudio Frizzarini</a>
- <a href="https://www.linkedin.com/in/j%C3%BAlia-araripe-0b761121a/">Júlia Araripe</a>


## 📜 Descrição

O projeto Mediway é uma solução em desenvolvimento para o monitoramento de temperatura em câmaras frias de caminhões de transporte de vacinas. 

A proposta do sistema é promover a manutenção da cadeia do frio, reduzindo perdas e assegurando que os insumos cheguem em condições ideais aos seus destinos. Para isso, são utilizados sensores de temperatura integrados a um sistema de acompanhamento em tempo real, permitindo alertas automáticos e maior controle durante todo o processo logístico.

Além de contribuir diretamente para a segurança da saúde pública, o Mediway também agrega valor em termos de sustentabilidade, reduzindo o desperdício de medicamentos e vacinas causados por falhas no transporte.


## 📁 Estrutura de pastas

Dentre os arquivos e pastas presentes na raiz do projeto, definem-se:

- <b>API/dat-acqu-ino-main</b>: Código da API para transmissão de dados do Arduino para o Banco de Dados.

- <b>Aplicação Web</b>: Nesta pasta estão todos os arquivos relacionados ao html do site, pasta style e assets.

- <b>style</b>: Contém todos os arquivos de estilização CSS do site.

- <b>assets</b>: aqui estão os arquivos relacionados a elementos não-estruturados deste repositório, como imagens.

- <b>Arduino</b>: Aqui está todo o código de desenvolvimento do Arduino.

- <b>Banco de Dados</b>: Todo o script e modelagem de dados criados para o desenvolvimento do projeto.

- <b>README.md</b>: arquivo que serve como guia e explicação geral sobre o projeto (o mesmo que você está lendo agora).

## 🔧 Como executar o código do Site Institucional
Certifique-se de ter instalado na sua máquina os seguintes softwares/IDEs:

- MySQL Workbench (ou similar);
- Visual Studio Code (ou similiar);
- Arduino IDE;

Cloque este repositório na sua máquina: "https://github.com/Project-MediWay/projeto-mediway-sprint2.git"

Para executar o código do Site Institucuinal: <br>
- Acessar a pasta Aplicação Web;<br>
- Acessar a pasta Public;<br>
- Acessar o arquivo "siteInstitucional.html";<br>
- Abra no navegador e explore a nossa solução.<br><br>
        
## 🔧 Como executar o código do Arduino UNO R3
Antes de executar o código, certifique-se de que a placa de Arduino está montada corretamente da seguinte forma:<br>

- Sensor LM35 conectado a protoboard com;<br>
- Protoboard conectado ao Arduinco utilizando Jumpers seguindo a ordem 5V, Porta Analógica e GND(aterramento);<br>
- Conectar Arduino ao computador via cabo USB.<br><br>

Para executar o código:<br>

- Abra o arquivo que está dentro da pasta Arduino no Arduino IDE;<br>
- Selecione o tipo de Arduino;<br>
- Verificar o código;<br>
- Carregar o código;<br>
- Abrir o SerialMonitor para visualizar os dados. <br><br>

## 🔧 Como executar o código da API-data_acqui_ino

Após clonar o repositório na máquina, execute esse passo a passo:

# Como usar

1. Certifique-se de que o Arduino está em funcionamento e capturando dado do sensor, seja ele analógico ou digital.

1. Clone este repositório em sua máquina.

1. Acesse o arquivo **main.js** e parametrize:

- Gostaria de efetuar a inserção dos dados capturados no Banco de Dados? **Linha 11 - HABILITAR_OPERACAO_INSERIR;**

- Para configurar as credenciais do banco de dados: adicione as credenciais para inserção no banco MySQL (**Linhas 22 - 26**) e ajuste seu INSERT para que esteja de acordo com a tabela que receberá as medidas (**Linhas 66 e 67**).

4. Acesse o local deste repositório no terminal (GitBash ou VSCode) e execute os comandos abaixo:

```
npm i
``` 
_O comando acima irá instalar as bibliotecas necessárias para o funcionamento da API. As bibliotecas a serem instaladas estão listadas no arquivo **package.json** então é muito importante que este não seja alterado. Será criada uma nova pasta/diretório chamado **node_modules** quando o comando for finalizado, que é onde as bibliotecas estão localizadas. Não altere a pasta/diretório._

```
npm start
``` 

_O comando acima irá iniciar sua API e efetuar os comandos de acordo com a sua parametrização feita nos passos anteriores._

5. Para "ver" sua API funcionando você pode visualizar os gráficos das capturas sendo exibidos no seu navegador pelo caminho **http://localhost:3300** ou efetuando SELECT no seu Banco de Dados, caso tenha optado por inseri-los.

6. Caso queira parar a API, tecle **CTRL+C** no terminal em que a API está rodando.


## 🗃 Histórico de lançamentos

* 0.1.0 - 31/10/2025
    















