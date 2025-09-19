# **Guia Prático: Replicação e Fragmentação de Banco de Dados MySQL na AWS**

Este guia irá conduzi-lo na configuração de um ambiente de banco de dados robusto e escalável na nuvem da AWS. Você aprenderá a implementar replicação para garantir alta disponibilidade e a aplicar fragmentação vertical para otimizar o desempenho de consultas.

-----

## **1. Objetivos de Aprendizagem**

Ao final deste laboratório, você será capaz de:

  * **Provisionar um Cluster MySQL Replicado** no serviço RDS da AWS, com uma instância de escrita (primária) e duas de leitura (réplicas).
  * **Carregar e Validar Dados** em um banco de exemplo, garantindo a consistência entre as instâncias.
  * **Testar e Comprovar a Replicação** de dados em tempo real.
  * **Otimizar a Estrutura do Banco** aplicando a técnica de fragmentação vertical em uma tabela.
  * **Compreender os Casos de Uso** para replicação, sharding e fragmentação.

-----

## **2. Pré-requisitos**

  * **Acesso à AWS:** Uma conta ativa no AWS Academy (ou conta pessoal) com permissões para criar recursos no RDS.
  * **Cliente SQL:** Um software para se conectar ao banco de dados, como MySQL Workbench (recomendado), DBeaver ou a linha de comando `mysql`.
  * **Script do Banco de Dados:** Faça o download do arquivo `movie_database.sql` fornecido.

-----

## **3. Arquitetura Alvo: O Que Vamos Construir?**

Nossa arquitetura consiste em um banco de dados principal (chamado de **Writer** ou *Primary*) e duas cópias somente leitura (chamadas de **Readers** ou *Read Replicas*).

  * **Instância Writer (Primária):** Centraliza todas as operações de escrita (`INSERT`, `UPDATE`, `DELETE`). Isso garante a consistência e a integridade dos dados.
  * **Instâncias Reader (Réplicas):** Recebem uma cópia assíncrona dos dados do Writer. Elas são usadas para distribuir a carga de leitura (`SELECT`), permitindo que a aplicação atenda a mais usuários simultaneamente sem sobrecarregar a instância principal.

<!-- end list -->

```
      [Sua Aplicação]
             |
             +-----> Operações de Escrita (INSERT, UPDATE) --> [ENDPOINT DO WRITER] ---+
             |                                                       (Instância Primária)   |
             |                                                                              | (Replicação)
             +-----> Operações de Leitura (SELECT) ----> [ENDPOINT DO READER 1] <-----------+
             |                                                       (Réplica de Leitura)   |
             |                                                                              |
             +-----> Operações de Leitura (SELECT) ----> [ENDPOINT DO READER 2] <-----------+
                                                                 (Réplica de Leitura)
```

-----

## **Parte A: Provisionando o Ambiente na AWS (RDS)**

Nesta etapa, vamos criar nosso cluster MySQL no Amazon RDS (Relational Database Service).

1.  **Acesse o Console AWS** e navegue até o serviço **RDS**.

2.  No painel do RDS, clique em **"Create database"**.

3.  **Configuração da Criação:**

      * Escolha **"Standard Create"** para ver todas as opções.
      * **Engine options:** Selecione **MySQL**.
      * **Templates:** Marque a opção **"Free tier"** para evitar custos (isso limitará a uma instância, mas o processo é o mesmo. Se precisar de múltiplas réplicas, use "Dev/Test").

4.  **Settings (Configurações):**

      * **DB instance identifier:** Dê um nome único, como `moviedb-instance`.
      * **Master username:** Defina um nome de usuário, como `admin`.
      * **Master password:** Crie e confirme uma senha segura. Anote-a\!

5.  **Connectivity (Conectividade):**

      * **Public access:** Selecione **"Yes"**. Isso é crucial para que você possa se conectar a partir do seu computador.
      * **VPC security group:** Escolha **"Create new"**. Dê um nome ao novo grupo, como `moviedb-sg`. O RDS irá configurá-lo automaticamente para permitir o acesso.

    > **Atenção:** Em um ambiente de produção, o acesso público nunca é recomendado. Faríamos o acesso através de uma VPC privada.

6.  Clique em **"Create database"**. O provisionamento pode levar alguns minutos.

7.  **Criando a Read Replica:**

      * Quando a instância principal (`moviedb-instance`) estiver com o status "Available", selecione-a.
      * Clique no menu **"Actions"** e depois em **"Create read replica"**.
      * Mantenha as configurações padrão e, no final da página, dê um identificador para a réplica (ex: `moviedb-replica-1`). Clique em **"Create read replica"**.

8.  **Anote os Endpoints:**

      * Volte para a lista de bancos de dados. Agora você verá suas duas instâncias.
      * Clique na instância **Writer** (`moviedb-instance`) e copie o valor de **"Endpoint"** na aba "Connectivity & security".
      * Faça o mesmo para a instância **Reader** (`moviedb-replica-1`).

Você terá dois endereços distintos, um para escrita e outro para leitura.

-----

## **Parte B: Conectando-se ao Banco de Dados**

Agora, vamos usar seu cliente SQL para abrir duas conexões simultâneas, simulando uma aplicação que lê e escreve ao mesmo tempo.

  * **Sessão A (Escrita):** Crie uma nova conexão no seu cliente SQL usando o **endpoint do Writer**. Nomeie-a, por exemplo, `MySQL-WRITER`.
  * **Sessão B (Leitura):** Crie uma *outra* nova conexão usando o **endpoint do Reader**. Nomeie-a `MySQL-READER`.

Deixe as duas janelas de conexão abertas, lado a lado.

-----

## **Parte C: Carga, Validação e Teste da Replicação**

Com as conexões ativas, vamos carregar os dados e ver a mágica da replicação acontecer.

1.  **Carga de Dados (Sessão A - WRITER):**

      * Na janela conectada ao **Writer**, abra e execute o script `movie_database.sql` completo. Ele criará as tabelas e inserirá os dados iniciais.
      * Este processo deve ser feito **apenas** na instância de escrita.

2.  **Validação dos Dados (Ambas as Sessões):**

      * Execute os comandos abaixo em **ambas as sessões (A e B)** para confirmar que os dados foram replicados. Os resultados devem ser idênticos.

    <!-- end list -->

    ```sql
    USE MovieDB;

    SELECT COUNT(*) FROM directors;
    SELECT COUNT(*) FROM actors;
    SELECT COUNT(*) FROM movies;
    SELECT COUNT(*) FROM movie_actors;
    ```

3.  **Teste de Replicação em Tempo Real:**

      * **Na Sessão A (WRITER)**, insira um novo diretor:
        ```sql
        INSERT INTO directors (name, nationality) VALUES ('Fulano de Tal', 'Brasileiro');
        ```
      * **Imediatamente na Sessão B (READER)**, tente buscar por este novo diretor:
        ```sql
        SELECT * FROM directors WHERE name = 'Fulano de Tal';
        ```
      * **Resultado:** É possível que a consulta não retorne nada no primeiro segundo. Execute-a novamente após 2-3 segundos. O novo registro aparecerá\! Essa pequena demora é a **latência de replicação**.

-----

## **Parte D: Otimização com Fragmentação Vertical**

**O Problema:** A tabela `actors` contém uma coluna `photo` do tipo `LONGBLOB`. BLOBs são objetos grandes que consomem muito espaço e podem deixar as consultas lentas, especialmente quando selecionamos colunas da tabela que não incluem a foto.

**A Solução:** Vamos aplicar a **fragmentação vertical**, que consiste em dividir uma tabela em duas ou mais, movendo as colunas menos acessadas ou muito grandes para uma nova tabela.

**Script de Fragmentação (Execute na Sessão A - WRITER):**

```sql
-- Use o banco de dados correto
USE MovieDB;

-- Passo 1: Criar a nova tabela para armazenar apenas as fotos.
-- A nova tabela terá uma chave primária (actor_id) que também é uma chave estrangeira,
-- garantindo um relacionamento 1-para-1 com a tabela 'actors'.
CREATE TABLE actor_photos (
    actor_id INT PRIMARY KEY,
    photo LONGBLOB,
    CONSTRAINT fk_actor_photo FOREIGN KEY (actor_id) REFERENCES actors(actor_id) ON DELETE CASCADE
);

-- Passo 2: Copiar os dados da tabela original para a nova.
-- Inserimos na 'actor_photos' o ID e a foto de cada ator da tabela 'actors'.
INSERT INTO actor_photos (actor_id, photo)
SELECT actor_id, photo FROM actors WHERE photo IS NOT NULL;

-- Passo 3: Remover a coluna de foto da tabela original.
-- Agora que os dados estão seguros na nova tabela, podemos eliminar a coluna 'photo' da tabela 'actors'.
ALTER TABLE actors DROP COLUMN photo;

-- Passo 4: Verificação!
-- Descreva a estrutura das duas tabelas para confirmar que a fragmentação foi bem-sucedida.
DESC actors;
DESC actor_photos;

```

Após executar o script, a tabela `actors` estará mais leve e otimizada para consultas gerais, enquanto os dados das fotos permanecem seguros e acessíveis na tabela `actor_photos`.

-----

## **5. Entregáveis**

Para concluir a atividade, reúna as seguintes evidências:

1.  **Prova da Replicação:** Uma captura de tela mostrando os dois clientes SQL lado a lado: à esquerda, o resultado do `INSERT` na sessão Writer; à direita, o resultado do `SELECT` na sessão Reader mostrando o mesmo dado.
2.  **Endpoints Utilizados:** Uma captura de tela do console da AWS RDS mostrando claramente os endpoints das instâncias Writer e Reader.
3.  **Resultado das Contagens:** O resultado dos quatro comandos `COUNT(*)` executados após a carga inicial dos dados.
4.  **Evidência da Fragmentação:** O resultado dos comandos `DESC actors` e `DESC actor_photos` após a execução do script da Parte D.
5.  **Reflexão Crítica (5 a 10 linhas):** Baseado no que você praticou, explique com suas palavras:
      * Quando a **replicação** (ter cópias de leitura) é uma estratégia mais indicada que o **sharding** (dividir os dados entre vários bancos)?
      * Em que cenários a **fragmentação vertical** (como a que fizemos) traz mais benefícios para um sistema?
