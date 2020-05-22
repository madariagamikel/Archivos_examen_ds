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
muestra26$nombre = iconv(muestra26$nombre, to="ASCII//TRANSLIT")#para eliminar problemas en el texto
muestra26$nombre = str_to_title(muestra26$nombre) #con esto hacemos que los nombres esten en un formato normal, con los nombre y apellidos en mayusculas.
muestra26$nombre = gsub("a\\?E", "n", muestra26$nombre ) #para corregir ñ
muestra26$nombre = gsub("ñ", "n", muestra26$nombre )
#muestra26$nombre = gsub('[[:punct:] ]+',' ',muestra26$nombre)

#tablas de frecencias por genero
hombres = filter(muestra26, muestra26$genero=="V")
mujeres = filter(muestra26, muestra26$genero=="M")

n_V = data.frame(table(hombres$nombre))
n_M = data.frame(table(mujeres$nombre))

#genero


#imputacion de genero
genero$genero_imp[genero$n_M>genero$n_V]="M"
genero$genero_imp[genero$n_V>genero$n_M]="V"
