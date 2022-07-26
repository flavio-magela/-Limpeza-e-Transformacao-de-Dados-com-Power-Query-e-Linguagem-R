# Mini-Projeto 2

# Limpeza e Transforma��o de Dados com Power Query e Linguagem R

# Definindo a pasta de trabalho
# Substitua o caminho abaixo pela pasta no seu computador
setwd("d:/Users/Flavio Magela/Documents/CursoBI/Cap12")
getwd()

# Instala os pacotes
install.packages("dplyr")
install.packages("data.table")
install.packages("ggplot2")

# Carrega os pacotes
library(dplyr)
library(data.table)
library(ggplot2)

# Carrega os dados
# Fonte de dados: https://archive.ics.uci.edu/ml/datasets/iris
dados_iris <- iris
View(dados_iris)


# Tarefa 1 - Sumarizar os dados com as m�dias de cada coluna de um dataset.
library(dplyr)
medias_iris <- summarize(group_by(dados_iris, Species),  # agrupar por especies
                         media_sepal_length = mean(Sepal.Length), 
                         media_sepal_width = mean(Sepal.Width),
                         media_petal_length = mean(Petal.Length), 
                         media_petal_width = mean(Petal.Width))

View(medias_iris)


# Tarefa 2 - Extrair o valor inteiro de uma das colunas decimais.
library(data.table)
dados_iris_id <- data.table(dados_iris) # converter meu conj de dados para o tipo data.table
View(dados_iris_id)
dados_iris_id$Sepal.Length <- as.integer(dados_iris_id$Sepal.Length) # converter em n�mero inteiro e pegar a primeira coluna
View(dados_iris_id)


# Para executar no Power Query
library(data.table)
dados_iris_id <- data.table(dados_iris)
dados_iris_id$Sepal.Length <- as.integer(dados_iris_id$Sepal.Length)
# View(dados_iris_id)

# Tarefa 3 - Construir um gr�fico mostrando a rela��o de duas vari�veis num�ricas para as 3 categorias de uma vari�vel categ�rica.
library(ggplot2)     
ggplot(data = dados_iris, aes(x = Petal.Width, y = Petal.Length)) +   # camada de dados - colocar 2 vari�veis n�m�ricas
  geom_point(aes(color = Species), size = 3) +      # Gr�fico de disper��o que represente 3 categorias que est�o nas colunas species
  ggtitle("Largura e Comprimento das P�talas") +    # titulo do Grafico
  labs(x = "Largura da P�tala",                     # Labels (X,Y)
       y = "Comprimento da P�tala") +
  theme_bw() +                                      # Outra camada que � o Tema, para deixar uma apar�ncia diferente
  theme(title = element_text(size = 15, color = "turquoise4"))    # Customizar o Tema, tamanho do texto e a cor do t�tulo

# Cores dispon�veis na Linguagem R
colors()  # Lista de cores do R

