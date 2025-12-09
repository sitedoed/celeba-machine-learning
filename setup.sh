#!/bin/bash

# Script de instalação para processamento de imagens - CelebA Dataset
# Para executar: chmod +x setup.sh && ./setup.sh

echo "=== Instalando dependências para processamento de imagens ==="

# Atualiza lista de pacotes
echo "1. Atualizando repositórios..."
sudo apt update

# Instala Python3 e pip se não existirem
echo "2. Verificando Python3 e pip..."
if ! command -v python3 &> /dev/null; then
    echo "Python3 não encontrado. Instalando..."
    sudo apt install -y python3 python3-pip
fi

if ! command -v pip3 &> /dev/null; then
    echo "pip3 não encontrado. Instalando..."
    sudo apt install -y python3-pip
fi

# Instala dependências do sistema para Pillow (bibliotecas de imagem)
echo "3. Instalando dependências do sistema para processamento de imagens..."
sudo apt install -y \
    python3-dev \
    python3-setuptools \
    libjpeg-dev \
    zlib1g-dev \
    libfreetype6-dev \
    liblcms2-dev \
    libopenjp2-7 \
    libtiff5-dev \
    libwebp-dev

# Instala pacotes Python
echo "4. Instalando pacotes Python..."
pip3 install --upgrade pip
pip3 install Pillow>=10.0.0 numpy>=1.24.0

# Verifica instalação
echo "5. Verificando instalação..."
python3 -c "from PIL import Image; import numpy; print('✓ PIL importado com sucesso'); print('✓ NumPy importado com sucesso'); print(f'PIL versão: {Image.__version__}'); print(f'NumPy versão: {numpy.__version__}')"

# Cria diretórios do projeto
echo "6. Criando estrutura de diretórios..."
mkdir -p /home/ed/mestrado/SIN5016/original_images
mkdir -p /home/ed/mestrado/SIN5016/optimized_images

echo "=== Instalação concluída! ==="
echo "Diretórios criados:"
echo "  - /home/ed/mestrado/SIN5016/original_images"
echo "  - /home/ed/mestrado/SIN5016/optimized_images"
echo ""
echo "Para executar o processamento:"
echo "  python3 process_images.py"