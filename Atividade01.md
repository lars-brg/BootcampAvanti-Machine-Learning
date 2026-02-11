# Respostas da Atividade 01
Obs.: Os meus conhecimentos acerca de machine learning são, em sua maioria, vindos de disciplinas na faculdade, Inteligência Computacional e Seminários de Computação, e um curso da NVIDIA de Aprendizado de Máquina, dessa forma é possível que minha visão esteja um pouco enviesada em razão dessas experiências anteriores.

## 1. Explique, com suas palavras, o que é machine learning?
Machine Learning (Aprendizado de Máquina) é um campo da Inteligência Artificial que permite que sistemas aprendam padrões a partir de dados para realizar previsões ou tomar decisões. O algoritmo utiliza os dados recebidos/coletados e personaliza a resolução de problemas complexos de acordo com o que ele "aprendeu".

## 2. Explique o conceito de conjunto de treinamento, conjunto de validação e conjunto de teste em machine learning. 
O conjunto de treinamento são todos os dados, já tratados, que vão ser utilizados pelo algoritmo para aprender as relações e padrões. O conjunto de validação são os dados utilizados para ajustar os parâmetros do modelo afim de escolher os melhores. Nessa parte que são feitas as verificações para evitar o overfitting. O conjunto de teste é um conjunto novo de dados, utilizado para testar o desempenho real do algoritmo e verificar sua capacidade de generalização.

## 3. Explique como você lidaria com dados ausentes em um conjunto de dados de treinamento.
Utilizaria modelos de reegrssão, ou algoritmos como KNN, para estimar o valor faltante com base em outras variáveis, caso não funcionasse, uma outra abordagem seria substituir os valores ausentes por medidas estatísticas.

## 4. O que é uma matriz de confusão e como ela é usada para avaliar o desempenho de um modelo preditivo? 
É uma tabela que mostra o desempenho do modelo comparando o que ele previu com o que realmente aconteceu. Ela é dividida em quatro quadrantes principais: verdadeiros positivos (quando o modelo prevê corretamente a classe positiva), verdadeiros negativos (quando prevê corretamente a classe negativa), falsos positivos (quando prevê positivo mas o valor real é negativo) e falsos negativos (quando prevê negativo mas o valor real é positivo). A partir disso podemos calcular métricas como acurácia, precisão, recall e f1-score, que utilizamos para entender se o modelo está errando mais por "alarme falso" ou por omissão.

## 5. Em quais áreas (tais como construção civil, agricultura, saúde, manufatura, entre outras) você acha mais interessante aplicar algoritmos de machine learning?
Acredito que as aplicações na saúde, tive uma amiga de faculdade cujo mestrado era voltado justamente para a análise de imagens de exames de raio-x, tomografia, ressonância magnética e etc. para prever se os pacientes estavam mais propensos ou não a certos tipos de câncer. As possiblidades de melhora na qualidade de vida e tratamento são gigantescas, então acredito que essa área seja uma das de maior interesse para mim.