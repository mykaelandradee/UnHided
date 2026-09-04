FROM python:3.11-slim

WORKDIR /app

# Atualiza os pacotes de forma limpa usando a versão base atualizada do Debian
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copia os arquivos locais do projeto (caso o Render já envie clonado, isso garante que tudo esteja presente)
COPY . /app

# Instala as dependências do Python
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 7860

# Mantém exatamente o seu comando de inicialização original
CMD ["uvicorn", "run:main_app", "--host", "0.0.0.0", "--port", "7860", "--workers", "4"]
