FROM python:3.10-slim

WORKDIR /app

# Instalar dependências do sistema
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copiar requirements e instalar dependências Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Instalar Jupyter
RUN pip install --no-cache-dir jupyter

# Criar diretórios de trabalho
RUN mkdir -p /app/data /app/scripts /app/notebooks

# Configurar variáveis de ambiente
ENV PYTHONPATH=/app
ENV PYTHONUNBUFFERED=1

# Porta para o Jupyter Notebook
EXPOSE 8888

# Comando padrão (pode ser sobrescrito)
CMD ["bash"]