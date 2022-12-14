# Consultar el directorio de trabajo actual.
getwd()

# Cambiar a un nuevo directorio de trabajo.
setwd("C:/Users/atien/OneDrive - Universidad de Alcala/Documents/GitHub/FCD/PL1")

# Leer un archivo en formato de tabla y crear una matriz de datos a partir de ?l.
s = read.table("satelites.txt")
s

# Obtener la dimensi?n de la matriz anterior.
dim(s)

# Crear una variable que almacena la columna Radio de la matriz s.
radio = s$Radio
radio

# Ordenar la matriz por filas teniendo en cuenta el valor del Radio.
so = s[order(radio),]
so

# Ordenar en orden inverso la matriz por filas teniendo en cuenta el valor del Radio.
so = s[rev(order(radio)),]
so

# Calcular la longitud de la variable Radio.
length(radio)

# Calcular el rango del Radio.
rangor = max(radio) - min(radio)
rangor

# Crear una funci?n que calcule el rango.
rango = function(x){max(x) - min(x)}

# Guardar la funci?n creada en un nuevo fichero.
dump("rango", file = "rango.R")

# Cargar la funci?n que se ha guardado en otro fichero.
source("rango.R")

# Calcular el rango del Radio usando la funci?n creada.
rango(radio)

# Calcular la frecuencia absoluta del Radio.
fabsr = table(radio)
fabsr

# Calcular la frecuencia absoluta acumulada del Radio.
faacumr = cumsum(fabsr)
faacumr

# Crear y guardar una funci?n para calcular la frecuencia relativa.
frel = function(x){table(x) / length(x)}
dump("frel", file = "frecrel.R")

# Calcular la frecuencia relativa del Radio con la funci?n creada.
frelr = frel(radio)
frelr

# Calcular la frecuencia relativa acumulada del Radio.
fracumr = cumsum(frelr)
fracumr

# Calcular la media del Radio.
mr = mean(radio)
mr

# Calcular la desviaci?n t?pica del Radio.
sdr = sd(radio)
sdr

# Calcular la varianza del Radio.
varr = var(radio)
varr

# Recalcular la varianza con la f?rmula de estad?stica descriptiva a partir del resultado anterior.
varr = varr * 11 / 12
varr

# Recalcular la desviaci?n t?pica con la f?rmula de estad?stica descriptiva a partir del resultado anterior.
sdr = sqrt((sdr^2) * 11 / 12)
sdr

# Calcular la mediana del Radio.
medr = median(radio)
medr

# Calcular los cuartiles del Radio.
cuar1r = quantile(radio, 0.25)
cuar1r
cuar2r = quantile(radio, 0.5)
cuar2r
cuar3r = quantile(radio, 0.75)
cuar3r

# Calcular el percentil 54 del Radio.
perc54r = quantile(radio, 0.54)
perc54r

