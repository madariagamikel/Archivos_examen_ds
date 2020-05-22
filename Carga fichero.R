load("E:/Descargas/archivos mikel/Universidad/Reto 4/DS/Examen_DS/Archivos_examen_ds/muestra26.RData")

library(stringr)
library(dplyr)

dim(muestra26)
colnames(muestra26)

#El dataset tiene 3 columnas y 334085 filas.
#La primera columna es un codigo, la segunda el nombre y la tercera el sexo.

names(muestra26) = c("nif", "nombre", "genero")

patron = "([[:digit:]]{8})([[:alpha:]]{1})"

a=str_extract(muestra26$nif, patron)

a=data.frame(a)

muestra26=inner_join(a, muestra26, by = c("a" = "nif"))

dim(muestra26)
#Ahora el dataset tiene 306197 filas