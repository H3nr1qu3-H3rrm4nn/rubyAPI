# Guia para Iniciar o Projeto Rails

Bem-vindo ao projeto! Siga os passos abaixo para configurar o ambiente e executar os testes.

## Passos para iniciar

1. **Clonar o repositório**  
Faça download deste repositório em sua máquina local:

2. **Acessar a pasta do projeto**
Navegue até o diretório do projeto:

```
cd finance_api
```

3. Instalar as dependências
```
bundle install
```
4. Executar os testes
Rode a suíte de testes para verificar se tudo está funcionando corretamente:

```bash
rspec
```
# Documentação e Guias

1. [Ruby](https://www.ruby-lang.org/pt/) 
2. [Ruby On Rails](https://guides.rubyonrails.org/v7.1/)

# Endpoints

## Usuários

### 1. Listar Usuários
- **Método:** GET
- **Endpoint:** `/users`
- **Descrição:** Retorna uma lista de todos os usuários.
- **Resposta:**
  ```json
  [
    {
      "id": 1,
      "email": "exemplo1@dominio.com",
      "name": "Usuário Um"
    },
    {
      "id": 2,
      "email": "exemplo2@dominio.com",
      "name": "Usuário Dois"
    }
  ]
  ```

### 2. Exibir Usuário
- **Método:** GET
- **Endpoint:** `/users/:id`
- **Descrição:** Retorna os detalhes de um usuário específico, identificado pelo `id`.
- **Resposta:**
  ```json
  {
    "id": 1,
    "email": "exemplo@dominio.com",
    "name": "Nome do Usuário"
  }
  ```

### 3. Criar Usuário
- **Método:** POST
- **Endpoint:** `/users`
- **Descrição:** Cria um novo usuário com os parâmetros fornecidos.
- **Body da Requisição:**
  ```json
  {
    "user": {
      "email": "exemplo@dominio.com",
      "name": "Nome do Usuário"
    }
  }
  ```
- **Resposta em caso de sucesso:**
  ```json
  {
    "id": 3,
    "email": "exemplo@dominio.com",
    "name": "Nome do Usuário"
  }
  ```
- **Resposta em caso de falha:**
  ```json
  {
    "errors": {
      "email": ["não pode ficar em branco"],
      "name": ["não pode ficar em branco"]
    }
  }
  ```

### 4. Atualizar Usuário
- **Método:** PATCH/PUT
- **Endpoint:** `/users/:id`
- **Descrição:** Atualiza os detalhes de um usuário existente, identificado pelo `id`.
- **Body da Requisição:**
  ```json
  {
    "user": {
      "email": "novoemail@dominio.com",
      "name": "Novo Nome do Usuário"
    }
  }
  ```
- **Resposta em caso de sucesso:**
  ```json
  {
    "id": 1,
    "email": "novoemail@dominio.com",
    "name": "Novo Nome do Usuário"
  }
  ```
- **Resposta em caso de falha:**
  ```json
  {
    "errors": {
      "email": ["não pode ficar em branco"],
      "name": ["não pode ficar em branco"]
    }
  }
  ```

### 5. Deletar Usuário
- **Método:** DELETE
- **Endpoint:** `/users/:id`
- **Descrição:** Deleta um usuário existente, identificado pelo `id`. Não retorna conteúdo em caso de sucesso.
- **Resposta em caso de sucesso:** `204 No Content`

## Categorias

# Endpoints do CategoriesController

O `CategoriesController` fornece os seguintes endpoints para gerenciar categorias:

### 1. Listar Categorias
- **Método:** GET
- **Endpoint:** `/categories`
- **Descrição:** Retorna uma lista de todas as categorias.
- **Resposta:**
  ```json
  [
    {
      "id": 1,
      "name": "Categoria Um",
      "description": "Descrição da Categoria Um"
    },
    {
      "id": 2,
      "name": "Categoria Dois",
      "description": "Descrição da Categoria Dois"
    }
  ]
  ```

### 2. Exibir Categoria
- **Método:** GET
- **Endpoint:** `/categories/:id`
- **Descrição:** Retorna os detalhes de uma categoria específica, identificada pelo `id`.
- **Resposta:**
  ```json
  {
    "id": 1,
    "name": "Categoria Um",
    "description": "Descrição da Categoria Um"
  }
  ```

### 3. Criar Categoria
- **Método:** POST
- **Endpoint:** `/categories`
- **Descrição:** Cria uma nova categoria com os parâmetros fornecidos.
- **Body da Requisição:**
  ```json
  {
    "category": {
      "name": "Nova Categoria",
      "description": "Descrição da Nova Categoria"
    }
  }
  ```
- **Resposta em caso de sucesso:**
  ```json
  {
    "id": 3,
    "name": "Nova Categoria",
    "description": "Descrição da Nova Categoria"
  }
  ```
- **Resposta em caso de falha:**
  ```json
  {
    "errors": {
      "name": ["não pode ficar em branco"],
      "description": ["não pode ficar em branco"]
    }
  }
  ```

### 4. Atualizar Categoria
- **Método:** PATCH/PUT
- **Endpoint:** `/categories/:id`
- **Descrição:** Atualiza os detalhes de uma categoria existente, identificada pelo `id`.
- **Body da Requisição:**
  ```json
  {
    "category": {
      "name": "Categoria Atualizada",
      "description": "Descrição Atualizada"
    }
  }
  ```
- **Resposta em caso de sucesso:**
  ```json
  {
    "id": 1,
    "name": "Categoria Atualizada",
    "description": "Descrição Atualizada"
  }
  ```
- **Resposta em caso de falha:**
  ```json
  {
    "errors": {
      "name": ["não pode ficar em branco"],
      "description": ["não pode ficar em branco"]
    }
  }
  ```

### 5. Deletar Categoria
- **Método:** DELETE
- **Endpoint:** `/categories/:id`
- **Descrição:** Deleta uma categoria existente, identificada pelo `id`. Não retorna conteúdo em caso de sucesso.
- **Resposta em caso de sucesso:** `204 No Content`


## Transações

### 1. Listar Transações
- **Método:** GET
- **Endpoint:** `/users/:user_id/transactions`
- **Descrição:** Retorna uma lista de todas as transações de um usuário específico.
- **Resposta:**
  ```json
  [
    {
      "id": 1,
      "amount": 100.0,
      "date": "2023-01-01",
      "description": "Transação Um",
      "kind": "entrada",
      "category": {
        "id": 1,
        "name": "Categoria Um"
      },
      "user": {
        "id": 1,
        "email": "usuario@dominio.com",
        "name": "Nome do Usuário"
      }
    },
    {
      "id": 2,
      "amount": 50.0,
      "date": "2023-01-02",
      "description": "Transação Dois",
      "kind": "saída",
      "category": {
        "id": 2,
        "name": "Categoria Dois"
      },
      "user": {
        "id": 1,
        "email": "usuario@dominio.com",
        "name": "Nome do Usuário"
      }
    }
  ]
  ```

### 2. Exibir Transação
- **Método:** GET
- **Endpoint:** `/users/:user_id/transactions/:id`
- **Descrição:** Retorna os detalhes de uma transação específica, identificada pelo `id`.
- **Resposta:**
  ```json
  {
    "id": 1,
    "amount": 100.0,
    "date": "2023-01-01",
    "description": "Transação Um",
    "kind": "entrada",
    "category": {
      "id": 1,
      "name": "Categoria Um"
    },
    "user": {
      "id": 1,
      "email": "usuario@dominio.com",
      "name": "Nome do Usuário"
    }
  }
  ```

### 3. Criar Transação
- **Método:** POST
- **Endpoint:** `/users/:user_id/transactions`
- **Descrição:** Cria uma nova transação com os parâmetros fornecidos.
- **Body da Requisição:**
  ```json
  {
    "transaction": {
      "amount": 150.0,
      "date": "2023-01-03",
      "description": "Nova Transação",
      "kind": "entrada",
      "category_id": 1
    }
  }
  ```
- **Resposta em caso de sucesso:**
  ```json
  {
    "id": 3,
    "amount": 150.0,
    "date": "2023-01-03",
    "description": "Nova Transação",
    "kind": "entrada",
    "category": {
      "id": 1,
      "name": "Categoria Um"
    },
    "user": {
      "id": 1,
      "email": "usuario@dominio.com",
      "name": "Nome do Usuário"
    }
  }
  ```
- **Resposta em caso de falha:**
  ```json
  {
    "errors": {
      "amount": ["não pode ficar em branco"],
      "date": ["não pode ficar em branco"],
      "description": ["não pode ficar em branco"],
      "kind": ["não pode ficar em branco"],
      "category_id": ["não pode ficar em branco"]
    }
  }
  ```

### 4. Atualizar Transação
- **Método:** PATCH/PUT
- **Endpoint:** `/users/:user_id/transactions/:id`
- **Descrição:** Atualiza os detalhes de uma transação existente, identificada pelo `id`.
- **Body da Requisição:**
  ```json
  {
    "transaction": {
      "amount": 200.0,
      "date": "2023-01-04",
      "description": "Transação Atualizada",
      "kind": "saída",
      "category_id": 2
    }
  }
  ```
- **Resposta em caso de sucesso:**
  ```json
  {
    "id": 1,
    "amount": 200.0,
    "date": "2023-01-04",
    "description": "Transação Atualizada",
    "kind": "saída",
    "category": {
      "id": 2,
      "name": "Categoria Dois"
    },
    "user": {
      "id": 1,
      "email": "usuario@dominio.com",
      "name": "Nome do Usuário"
    }
  }
  ```
- **Resposta em caso de falha:**
  ```json
  {
    "errors": {
      "amount": ["não pode ficar em branco"],
      "date": ["não pode ficar em branco"],
      "description": ["não pode ficar em branco"],
      "kind": ["não pode ficar em branco"],
      "category_id": ["não pode ficar em branco"]
    }
  }
  ```

### 5. Deletar Transação
- **Método:** DELETE
- **Endpoint:** `/users/:user_id/transactions/:id`
- **Descrição:** Deleta uma transação existente, identificada pelo `id`. Não retorna conteúdo em caso de sucesso.
- **Resposta em caso de sucesso:** `204 No Content`
