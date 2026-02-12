#!/bin/bash

# Nome da pasta do ambiente virtual
VENV_NAME=".venv"

# 1. Verifica se a venv já existe
if [ ! -d "$VENV_NAME" ]; then
    echo "Creating virtual environment: $VENV_NAME..."
    python -m venv $VENV_NAME
    echo "✅ Venv criada com sucesso."
else
    echo "💡 Venv já existe. Pulando criação..."
fi

# 2. Ativa o ambiente virtual
# No Windows, o caminho é Scripts/activate e não bin/activate
echo "🔌 Ativando a venv..."
source $VENV_NAME/Scripts/activate

# 3. Verifica se o requirements.txt existe e instala as dependências
if [ -f "requirements.txt" ]; then
    echo "📦 Instalando/Atualizando dependências..."
    python -m pip install --upgrade pip
    pip install -r requirements.txt
    echo "✅ Tudo pronto!"
else
    echo "⚠️  Aviso: 'requirements.txt' não encontrado. Nada para instalar."
fi