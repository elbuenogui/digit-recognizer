# Variáveis
IMAGE_NAME=projeto_datascience
CONTAINER_NAME=projeto_datascience_container
JUPYTER_PORT=8888
CURRENT_DIR=${PWD}

# Configuração do ambiente para VSCode
setup-vscode:
	@echo "Criando arquivos de configuração para o VSCode Dev Containers..."
	@mkdir -p .devcontainer
	@echo '{\n\
	"name": "Projeto Data Science",\n\
	"dockerFile": "docker/Dockerfile",\n\
	"workspaceFolder": "/app",\n\
	"workspaceMount": "source=${localWorkspaceFolder},target=/app,type=bind",\n\
	"forwardPorts": [$(JUPYTER_PORT)],\n\
	"runArgs": [],\n\
	"extensions": [\n\
		"ms-python.python",\n\
		"ms-toolsai.jupyter"\n\
	],\n\
	"settings": {\n\
		"python.defaultInterpreterPath": "/usr/local/bin/python",\n\
		"python.linting.enabled": true\n\
	}\n\
}' > .devcontainer/devcontainer.json
	@echo "Configuração criada. Agora você pode abrir o VSCode e usar o comando 'Reopen in Container'"
	@echo "Ou pressionar F1 e digitar 'Remote-Containers: Reopen in Container'"

# Executar build da imagem manualmente (alternativa ao VSCode Dev Containers)
build-image:
	docker build -t $(IMAGE_NAME) -f docker/Dockerfile .

# Iniciar container manualmente (alternativa ao VSCode Dev Containers)
start-container:
	@echo "Verificando se o container já existe..."
	@if [ "$(docker ps -a -q -f name=$(CONTAINER_NAME))" ]; then \
		echo "Container $(CONTAINER_NAME) já existe."; \
		if [ "$(docker ps -q -f name=$(CONTAINER_NAME))" ]; then \
			echo "Container já está em execução."; \
		else \
			echo "Container existe mas não está rodando. Iniciando..."; \
			docker start $(CONTAINER_NAME); \
		fi; \
	else \
		echo "Criando novo container..."; \
		docker run -d --name $(CONTAINER_NAME) -p $(JUPYTER_PORT):$(JUPYTER_PORT) \
			-v "${CURRENT_DIR}:/app" \
			$(IMAGE_NAME); \
	fi

# Parar e remover o container
stop:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)

# Reiniciar o container
restart:
	docker restart $(CONTAINER_NAME)

# Executar script1
run-script1:
	python /app/scripts/script1.py

# Executar script2
run-script2:
	python /app/scripts/script2.py

# Executar script3
run-script3:
	python /app/scripts/script3.py

# Processar os dados extraídos
process-data:
	python /app/scripts/process_data.py

# Exportar dados para CSV
export-csv:
	python /app/scripts/export_csv.py

# Salvar no banco de dados
save-db:
	python /app/scripts/save_to_db.py

# Rodar o Jupyter Notebook
run-jupyter:
	jupyter notebook --ip=0.0.0.0 --port=$(JUPYTER_PORT) --allow-root --NotebookApp.token='senha' --no-browser

# Fazer o backup dos dados
backup:
	python /app/scripts/backup.py

# Gerar relatórios
generate-reports:
	python /app/scripts/generate_reports.py

# Limpar ambiente (remove o container existente)
clean:
	@echo "Verificando se o container existe para remover..."
	@if [ "$(docker ps -a -q -f name=$(CONTAINER_NAME))" ]; then \
		echo "Parando e removendo container existente..."; \
		docker stop $(CONTAINER_NAME) 2>/dev/null || true; \
		docker rm $(CONTAINER_NAME) 2>/dev/null || true; \
		echo "Container removido."; \
	else \
		echo "Nenhum container existente para remover."; \
	fi

# Inicializar ambiente de desenvolvimento completo (alternativa ao VSCode)
init-dev: build-image start-container
	@echo "Ambiente de desenvolvimento inicializado. Container ID: $(CONTAINER_NAME)"
	@echo "Para acessar o Jupyter Notebook: http://localhost:$(JUPYTER_PORT)"

# Reinicializar completamente o ambiente (rebuild)
reinit: clean build-image start-container
	@echo "Ambiente de desenvolvimento reinicializado. Container ID: $(CONTAINER_NAME)"
	@echo "Para acessar o Jupyter Notebook: http://localhost:$(JUPYTER_PORT)"