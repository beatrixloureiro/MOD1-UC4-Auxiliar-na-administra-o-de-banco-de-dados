# UC4 - Desenvolvimento e Gerenciamento de Banco de Dados

Este repositório contém as atividades realizadas na unidade curricular **UC4: Desenvolvimento e Gerenciamento de Banco de Dados**. As atividades abrangem segurança, programação avançada em SQL, otimização de consultas, normalização e utilização de bancos de dados NoSQL.

---

## 📚 Atividades Incluídas

### **Atividade 1 - Segurança no Banco de Dados**
Configuração de usuários e permissões, além do planejamento de backups para prevenir futuros desastres no banco de dados.

#### **Ações Realizadas:**
1. Criação do usuário `user_relatorio` com permissões somente de leitura (SELECT).
2. Criação do usuário `user_funcionario` com permissões de leitura e manipulação de dados (SELECT, INSERT, UPDATE, DELETE) para tabelas específicas.
3. Planejamento de backups periódicos com detalhamento de comandos e agendamento.

#### **Entregas:**
- Scripts SQL para criação de usuários e permissões.
- Relatório detalhado em PDF com plano de backup e evidências.

---

### **Atividade 2 - Sub-rotinas em Banco de Dados**
Desenvolvimento de stored procedures, stored functions e triggers para atender a novas necessidades do sistema.

#### **Funcionalidades Implementadas:**
1. **Stored Procedure**: Relatório de compras por cliente entre datas especificadas.
2. **Stored Function**: Classificação de clientes como "PREMIUM" ou "REGULAR" com base no valor total de compras.
3. **Trigger**: Aplicação automática de MD5 à coluna `senha` ao incluir novos usuários.

#### **Entregas:**
- Scripts SQL para criação e execução das sub-rotinas.

---

### **Atividade 3 - Otimização de Consultas**
Análise, otimização e criação de índices para melhorar o desempenho de consultas no banco de dados.

#### **Ações Realizadas:**
1. Execução do comando `EXPLAIN` para análise de desempenho das consultas originais.
2. Ajuste das consultas com uso de JOINs e seleção de colunas específicas.
3. Criação de índices nas colunas utilizadas nas cláusulas WHERE.
4. Reavaliação com `EXPLAIN` para verificar melhorias.
5. Criação de views otimizadas.

#### **Entregas:**
- Scripts SQL com consultas otimizadas, criação de índices e views.
- Relatório comparativo de desempenho antes e depois das otimizações.

---

### **Atividade 4 - Normalização de Dados**
Aplicação das formas normais em tabelas para eliminar anomalias e melhorar a estrutura do banco.

#### **Ações Realizadas:**
1. **1FN**: Ajustes na tabela `Cliente` para garantir a atomicidade dos dados.
2. **2FN**: Normalização da tabela `Item_venda` para remover dependências parciais.
3. **3FN**: Normalização da tabela `Venda` para eliminar dependências transitivas.

#### **Entregas:**
- Relatório detalhado explicando os problemas e soluções propostas.
- Scripts SQL para as tabelas normalizadas.

---

### **Atividade 5 - Trabalhando com Bancos NoSQL**
Tradução da tabela `Produto` para um banco NoSQL utilizando MongoDB, com manipulação e consultas.

#### **Ações Realizadas:**
1. Criação de um banco de dados e coleção para produtos no MongoDB.
2. Inclusão de dados de produtos com campos relevantes.
3. Atualização de registros existentes.
4. Consultas por nome e fabricante.

#### **Entregas:**
- Arquivo TXT com comandos MongoDB e resultados obtidos.

---

## 🛠️ Ferramentas Utilizadas
- **MySQL Workbench**: Modelagem e execução de scripts SQL.
- **MySQL**: Gerenciamento do banco de dados relacional.
- **MongoDB Compass**: Manipulação do banco NoSQL.
- **Linguagem SQL**: Desenvolvimento de scripts e consultas.
- **Linguagem MongoDB**: Criação e manipulação de dados NoSQL.

---

## ✨ Sobre o Repositório
Este repositório foi desenvolvido como parte do aprendizado em gerenciamento de bancos de dados. Ele documenta todas as etapas, desde a configuração de segurança até a introdução ao uso de bancos NoSQL.

**Responsável pelo desenvolvimento:** Ana Beatriz Loureiro  
