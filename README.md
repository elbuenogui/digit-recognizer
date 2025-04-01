# Projeto Data Science

Este repositório contém um ambiente de desenvolvimento completo para projetos de ciência de dados ou  IA utilizando Docker. O ambiente inclui Python, Jupyter Notebook e diversas bibliotecas para análise de dados e machine learning.

## 📋 Pré-requisitos

- [Docker](https://docs.docker.com/get-docker/) instalado
- [Make](https://www.gnu.org/software/make/) (disponível por padrão na maioria das distribuições Linux e macOS)
- [Visual Studio Code](https://code.visualstudio.com/) (opcional, mas recomendado)
  - Com as extensões [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) e [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)

## 🚀 Início Rápido

### Opção 1: Usando VS Code com Dev Containers (Recomendado)

1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/projeto-datascience.git
   cd projeto-datascience
   ```

2. Configure o ambiente para VS Code:
   ```bash
   make setup-vscode
   ```

3. Abra o VS Code no diretório do projeto e escolha "Reopen in Container" quando solicitado (ou pressione F1 e digite "Remote-Containers: Reopen in Container").

4. O VS Code construirá a imagem e iniciará o container automaticamente.

### Opção 2: Usando Docker (sem VS Code)

1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/projeto-datascience.git
   cd projeto-datascience
   ```

2. Inicialize o ambiente:
   ```bash
   make init-dev
   ```

3. Acesse o shell do container:
   ```bash
   make shell
   ```

### Opção 3: Usando Docker Compose

1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/projeto-datascience.git
   cd projeto-datascience
   ```

2. Inicie os containers:
   ```bash
   docker-compose up -d
   ```

3. Acesse o shell do container:
   ```bash
   docker exec -it projeto_datascience_container bash
   ```

## 📊 Executando o Jupyter Notebook

Para iniciar o Jupyter Notebook:

```bash
make run-jupyter
```

Depois, acesse `http://localhost:8888` no seu navegador (a senha é `senha` por padrão).

## 🔧 Comandos Disponíveis

### Comandos de Configuração

| Comando | Descrição |
|---------|-----------|
| `make setup-vscode` | Cria configurações para VS Code Dev Containers |
| `make build-image` | Constrói a imagem Docker |
| `make start-container` | Inicia o container (verifica se já existe) |
| `make init-dev` | Constrói a imagem e inicia o container |
| `make reinit` | Limpa, reconstrói e reinicia o ambiente |

### Comandos de Gerenciamento

| Comando | Descrição |
|---------|-----------|
| `make stop` | Para e remove o container |
| `make restart` | Reinicia o container |
| `make shell` | Acessa o shell dentro do container |
| `make clean` | Remove o container existente |

### Comandos de Execução

| Comando | Descrição |
|---------|-----------|
| `make run-script1` | Executa o script1.py |
| `make run-script2` | Executa o script2.py |
| `make process-data` | Executa o processamento de dados |
| `make export-csv` | Exporta dados para CSV |
| `make save-db` | Salva dados no banco de dados |
| `make run-jupyter` | Inicia o Jupyter Notebook |
| `make backup` | Faz backup dos dados |
| `make generate-reports` | Gera relatórios |

## 🔄 Ciclo de Vida do Ambiente

1. **Primeira Inicialização**: Use `make setup-vscode` ou `make init-dev`
2. **Uso Diário**: Use `make start-container` ou VS Code "Reopen in Container"
3. **Desenvolvimento**: Execute scripts com `make run-script1`, etc.
4. **Ao Finalizar**: Use `make stop` para parar temporariamente
5. **Limpeza**: Use `make clean` para remover o container

## 📁 Estrutura de Diretórios

```
projeto_datascience/
│
├── docker/                  # Arquivos relacionados ao Docker
│   └── Dockerfile           # Definição da imagem Docker
│
├── .devcontainer/           # Configuração para VS Code (gerado com o `make setup-vscode`)
│   └── devcontainer.json    # Configuração do ambiente de desenvolvimento
│
├── scripts/                 # Scripts Python para processamento
│   ├── script1.py
│   ├── script2.py
│   └── ...
│
├── notebooks/               # Jupyter Notebooks
│   └── ...
│
├── data/                    # Dados
│   ├── raw/                 # Dados brutos
│   └── processed/           # Dados processados
│
├── Makefile                 # Comandos úteis
├── docker-compose.yml       # Configuração do Docker Compose
└── requirements.txt         # Dependências Python
```

## ⚙️ Personalização

### Alterando a Porta do Jupyter

Edite a variável `JUPYTER_PORT` no Makefile.

### Adicionando Dependências Python

1. Adicione as bibliotecas ao arquivo `requirements.txt`
2. Reconstrua o ambiente com `make reinit`

### Adicionando Novos Scripts

1. Crie seus scripts na pasta `scripts/`
2. Adicione novos comandos ao Makefile seguindo o padrão existente

## 🔒 Referências e Boas Práticas

- Mantenha o ambiente Docker atualizado
- Use versionamento de dados quando possível
- Documente seus scripts e análises
- Separe dados brutos de dados processados
- Use notebooks para exploração e scripts para processamento em produção

## 📝 Licença

[MIT](LICENSE)

---

Projeto criado para facilitar o desenvolvimento em projetos de ciência de dados.