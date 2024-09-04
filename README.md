# Sistema de Monitoramento de Saúde dos Corais (SMSC)

## Descrição

Este projeto consiste na criação de um banco de dados relacional para a ONG **CoralData**, com o objetivo de facilitar a análise e o monitoramento da saúde dos recifes de coral da costa brasileira, focando nas 24 espécies endêmicas que existem somente no Brasil. O sistema permite a consulta de dados sobre recifes de corais, suas localizações, espécies, gêneros e as ameaças que enfrentam. A iniciativa visa apoiar pesquisadores, conservacionistas e o público em geral no desenvolvimento de projetos de pesquisa e na promoção do conhecimento sobre esses ecossistemas vitais.

## Como Instalar e Rodar o Projeto

### Pré-requisitos

- **MySQL** instalado em sua máquina.
- Um cliente MySQL como o **MySQL Workbench** ou acesso via linha de comando.
- Clonar este repositório ou baixar os arquivos SQL fornecidos.

### Passos para Instalação

1. **Clone o repositório** ou baixe os arquivos SQL para sua máquina local.
   ```bash
   git clone https://github.com/seu-usuario/seu-repositorio.git
   ```

2. **Abra o cliente MySQL** e conecte-se ao seu servidor local.

3. **Crie o banco de dados** executando o script `create_database.sql`:
   ```sql
   SOURCE /caminho/para/o/arquivo/create_database.sql;
   ```

4. **Popule o banco de dados** com os dados iniciais executando o script `populate_database.sql`:
   ```sql
   SOURCE /caminho/para/o/arquivo/populate_database.sql;
   ```

5. **Verifique as tabelas** para garantir que os dados foram inseridos corretamente:
   ```sql
   SHOW TABLES;
   ```

## Como Usar

Após a instalação e configuração do banco de dados, você pode executar consultas para obter informações relevantes. Algumas das funcionalidades incluem:

- **Listar estados com recifes de corais**.
- **Contar o número total de recifes registrados**.
- **Identificar recifes com níveis de branqueamento alto ou baixo**.
- **Obter o número de recifes em um estado específico**.
- **Determinar as ameaças mais presentes nos recifes**.
- **Selecionar recifes com impacto humano alto ou médio**.
- **Contar o total de recifes presentes no Brasil**.

### Executando Consultas de Exemplo

Use o arquivo `queries.sql` para executar consultas pré-definidas:

```sql
SOURCE /caminho/para/o/arquivo/queries.sql;
```

Ou execute consultas diretamente no cliente MySQL. Exemplo:

```sql
-- Liste os estados que possuem recifes de corais
SELECT 
    rc.nome_recife,
    l.estado
FROM recifes_de_corais rc
JOIN localizacao l ON rc.cidade = l.cidade;
```

## Como Contribuir

Se você deseja contribuir para o projeto, siga os passos abaixo:

1. **Faça um fork** do projeto.

2. **Crie uma nova branch** para suas modificações:
   ```bash
   git checkout -b minha-nova-funcionalidade
   ```

3. **Commit** suas alterações:
   ```bash
   git commit -m "Adiciona nova funcionalidade"
   ```

4. **Envie para o repositório remoto**:
   ```bash
   git push origin minha-nova-funcionalidade
   ```

5. **Abra um Pull Request** explicando suas alterações.

## Licença

Este projeto está licenciado sob a licença [MIT License](LICENSE). Sinta-se à vontade para usar, modificar e distribuir conforme as condições da licença.

---

**Observação:** Este projeto é uma iniciativa para apoiar a conservação dos recifes de corais brasileiros. Agradecemos seu interesse e contribuição!
