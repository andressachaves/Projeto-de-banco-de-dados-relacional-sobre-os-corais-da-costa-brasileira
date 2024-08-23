# Projeto-de-banco-de-dados-relacional-sobre-os-corais-da-costa-brasileira
# Sistema de Monitoramento de Saúde dos Corais (SMSC)

## Descrição do Projeto

Este projeto foi liderado por **Andressa Chaves** e tem como objetivo a criação de um banco de dados relacional que permita a consulta e análise de dados sobre os impactos ambientais nos recifes de corais brasileiros. O sistema, denominado **Sistema de Monitoramento de Saúde dos Corais (SMSC)**, foi desenvolvido para a ONG CoralData, que se dedica à pesquisa, monitoramento e conscientização sobre os corais localizados na costa brasileira.

O banco de dados SMSC foi projetado para facilitar o acesso a informações críticas sobre a saúde dos recifes de corais, com foco nas 24 espécies endêmicas que só existem no Brasil. A plataforma permitirá que usuários consultem e utilizem esses dados sem nenhum custo, incentivando o desenvolvimento de projetos de pesquisa e promovendo o conhecimento sobre esses importantes ecossistemas.

## Estrutura do Banco de Dados

### Projeto Conceitual

O modelo de dados do SMSC foi concebido a partir do minimundo das entidades relacionadas aos recifes de corais, identificando as seguintes entidades:

- **Recifes de Corais**: Identificados por uma sigla, com atributos como nome, tipo, localização, área e profundidade. 
- **Espécies**: Classificadas em três grupos principais: corais verdadeiros, hidrocorais e corais moles, com atributos como nome científico, nome comum e grupo.
- **Corais**: Componentes estruturais dos recifes, identificados por uma sigla, com atributos como nome popular, nome científico e tipo de formação.
- **Ameaças**: Fatores que podem prejudicar ou destruir os recifes de corais, classificados por origem (atividade humana ou causas naturais) e com atributos como nome e descrição.
- **Saúde dos Corais**: Indicador do estado geral do recife, influenciado pelas ameaças, e classificado em níveis de comprometimento.

### Relacionamentos

- **Recifes de corais** contêm uma ou mais espécies.
- **Coral** pertence a uma espécie.
- **Ameaças** afetam recifes de corais.
- **Saúde dos corais** é influenciada por ameaças.

### Requisitos Funcionais

O sistema deve:

1. Armazenar informações sobre a localização dos recifes de corais.
2. Armazenar informações sobre a saúde dos recifes de corais.
3. Armazenar informações sobre as ameaças que os recifes de corais estão enfrentando.

### Consultas

O SMSC permitirá realizar consultas como:

1. Consultar todos os recifes de corais da costa brasileira.
2. Consultar todos os corais endêmicos da costa brasileira.
3. Consultar todos os corais endêmicos localizados no recife de Fernando de Noronha.
4. Consultar corais endêmicos em estado de comprometimento.
5. Consultar a espécie de coral mais ameaçada na costa brasileira.
6. Consultar recifes de corais em áreas de alto risco de poluição.
7. Consultar a espécie de coral em declínio mais rápido.
8. Consultar recifes de corais em áreas de alto risco de desenvolvimento costeiro.
9. Consultar recifes de corais em áreas de alto risco de aumento do nível do mar.
10. Consultar recifes de corais em áreas de alto risco de acidificação dos oceanos.

## Ferramentas Utilizadas

- **SQL Server**
- **MySQL Workbench**
- **Azure Data Studio**

## Como Contribuir

Contribuições para o aprimoramento do Sistema de Monitoramento de Saúde dos Corais são bem-vindas. Para contribuir, abra uma issue ou envie um pull request com suas sugestões.

## Licença

Este projeto está licenciado sob a [BSB License](LICENSE).

---

Projeto liderado por **Andressa Chaves**.

