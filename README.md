# 🍅 Fruits and Vegetable Classification
Projeto desenvolvido durante o Bootcamp de Machine Learning da Escola Atlântico Avanti com o objetivo de construir um modelo de classificação de imagens de frutas e vegetais utilizando técnicas de Deep Learning e otimização de pipeline.

**Tema:** Classificação de Frutas e Vegetais

## Visão Geral
Este projeto implementa um pipeline completo de Visão Computacional para classificação de frutas e vegetais utilizando **Transfer Learning** com **MobileNetV2**.

O dataset utilizado contém cerca de 3500 imagens distribuídas em 36 classes entre frutas e vegetais.

Durante a análise exploratória, foram identificados alguns desafios importantes:

- Desbalanceamento entre classes
- Necessidade de Data Augmentation
- Padronização de formatos de imagem
- Presença de duplicatas no dataset 

## Pipeline
**Fonte:** Dataset "Fruits and Vegetables Image Recognition" (Kaggle).

O projeto foi estruturado em etapas que vão desde o tratamento dos dados até a otimização do modelo.

✔️ **Ingestão e preparação dos dados**

Inicialmente o dataset foi analisado para identificar inconsistências e necessidades de pré-processamento. Algumas ações foram realizadas:

- Normalização das imagens
- Padronização de formatos
- Remoção de duplicatas
- Aplicação de Data Augmentation

✔️ **Otimização do pipeline de dados**

O pipeline original utilizava `ImageDataGenerator` do TensorFlow, o que causava alguns problemas:

- GPU permanecia ociosa durante parte do treinamento  
- Data Augmentation era aplicada no conjunto de validação  

A solução adotada foi migrar para a API `tf.data`, utilizando:

```
</> Python

image_dataset_from_directory()
```

Além disso, agora o **Data Augmentation** é implementado como camada no *Keras* e o `.prefetch()` foi utilizado para a criação de uma linha de produção em que enquanto a GPU treina o batch atual, a CPU já prepara o próximo.

✔️ **Pré-processamento com CLAHE**

Para melhorar a qualidade visual das imagens foi aplicada a técnica CLAHE (*Contrast Limited Adaptive Histogram Equalization*). A técnica divide a imagem em blocos e limita contrastes, resultando em imagens mais uniformes com detalhes realçados (como texturas).

✔️ **Arquitetura do Modelo**

O modelo base utilizado foi MobileNetV2. Devido a defasagem, a arquitetura original foi modificada para reduzir *overfitting* devido às duas camadas densas que modelo adicionava à saída final.

As alterações realizadas se concentraram na substituição dessas camadas densas por: 

`GlobalAveragePooling2D`

`Dropout`

Essa modificação incentiva o modelo a aprender padrões mais generalizáveis, em vez de memorizar o dataset.

✔️ **Otimização de Hiperparâmetros**

Para otimização do treinamento foi utilizada **Busca Bayesiana** com a biblioteca **Optuna**, utilizando o algoritmo TPE (*Tree-structured Parzen Estimator*) para encontrar valores ideais para **Learning Rate** e **Dropout**.

<img width="1450" height="345" alt="Captura de tela 2026-03-07 080438" src="https://github.com/user-attachments/assets/8b0644cb-d08e-4522-b392-6cfb037d4e87" />

## 📊 **Resultados**

Nos testes iniciais, sem as melhorias no pipeline, o modelo atingiu aproximadamente:

**Acurácia:** ~95% em apenas 5 épocas.

Apesar do valor elevado, uma análise mais cuidadosa revelou problemas importantes no processo de treinamento, como:

- Overfitting
- Possível data leakage
- Pipeline de dados ineficiente

Após a correção do pipeline, implementação de Data Augmentation adequado, uso de Dropout e otimização do fluxo de dados com `tf.data`, o modelo passou a apresentar resultados mais realistas.

**Acurácia final:** ~90%

Embora a acurácia tenha diminuído, o treinamento tornou-se mais rigoroso e confiável, indicando que o modelo passou a aprender padrões mais generalizáveis em vez de memorizar o dataset.

<img width="547" height="435" alt="download (2)" src="https://github.com/user-attachments/assets/97fc41c7-6ff4-4a19-be50-aa76b8024bf2" />

🔎 **Matriz de Confusão**

<img width="1419" height="1250" alt="download" src="https://github.com/user-attachments/assets/3be752c9-d0be-4cc6-adcf-c7563c8544e0" />

🧪 **Exemplos de Predição**

Abaixo estão alguns exemplos de predições do modelo em imagens do dataset e da internet.

<table>
  <tr>
    <td align="center"><img src="https://github.com/user-attachments/assets/05e2eada-173f-4050-b303-03c5648b93a8" alt="Imagem 1" width="450px"><br />Dataset</td>
   <td align="center"><img src="https://github.com/user-attachments/assets/e05b1afe-2d13-497f-bfbb-9ee104688cfb" alt="Imagem 1" width="450px"><br />Internet</td>
  </tr>
</table>




### Passos para rodar o código (opcional):

1. Certifique-se de estar usando o **Git Bash** no **Windows** e execute para rodar o script de setup:

```bash
./setup.sh
```

2. Caso não ative a .venv, pode ativar através de:

```bash
source .venv/Scripts/activate
```

3. Com o kernel da .venv selecionado pode rodar os notebooks em /notebooks! 
