# README -
# 
# 
# en este codigo pretendemos tratar con los datos de la salida de campo realizada en el mes de octubre al area Oriental de Ecuador
# se tomo las muestras en dos localidades Reserva Rio Anzu y Reserva Rio Zunac
#
# necesitamos analizar los datos obtenidos mediantes diferentes indices
# 1. indice de shannnon 
# 2. indice de simpson
#
# realizar mapas de las areas muestreadas a traves de rasters
# 
# 
# 
#       boxplot de familias comparadas para las dos reservas
#       

install.packages("vegan")       # instalar programa vegan para analisis

library(vegan)                  # llamar el programa

data.salida <- read.csv("")     #  cargar tabla de la salida
                                #  
                                #  IMPORTANTE!!         ##
                                #  para el uso en el programa necesitamos
                                #  tener los datos de ESPECIES en las COLUMNAS
                                #  y datos de las unidades de muestreo en las FILAS
                                #  en cada celda va la frecuencia en dicha area

herp1 <- read_delim("~/1.USFQ/TESIS/HERPETO/HERPETO/herp1.csv", 
                      +     ";", escape_double = FALSE, col_types = cols(X1 = col_skip()), 
                      +     trim_ws = TRUE)


                ## INDICE DE SHANNON  ##
                ## 

diversity(herp1)

                ##         ANZU    |   ZUNAC
                ##   [1] 3.216358  |  2.385231 
                ##   
                ##   datos que nos da sobre el indice de shannon 
                ##   
  

                ##  INDICE DE SIMPSON
                ##  
diversity(herp1, index = "simpson")

                ##      anzu            zunac   
                ## [1] 0.9577778        0.8884688


specnumber(herp1)

H <- diversity(herp1)                           ##      Shannon index 
H

J <- H/log(specnumber(herp1))                   ##       Pielou’s evenness J = H0/log(S) 
J

        ##       
        ##      R´enyi and Tsallis diversities
        ##      

k <- sample(nrow(herp1), 2)
k

R <- renyi(herp1[k,])
R



plot(R)


##              The plot uses Trellis graphics with a 
##              separate panel for each site. The dots 
##              show the values for sites, and the lines
##               the extremes and median in the data set.
##               
##               los graficos que obtenemos nos muestran tres lineas la mediana 
##               y los extremos superior e inferior
##               
##               

boxplot(R)

##      α parameter of Fisher’s log-series can be used as a diversity index 
##
##

alpha <- fisher.alpha(herp1)
alpha

save.image("~/1.USFQ/TESIS/HERPETO/HERPETO/herpRworkspace.RData")

require(graphics)

plot(density(c(-20, rep(0,98), 20)), xlim = c(-4, 4))  # IQR = 0

# The Old Faithful geyser data
d <- density(faithful$eruptions, bw = "sj")
d
plot(tabla_de_especies_herpeto)

d <- density(herp1$)





data(dune)
data(dune.env)
mod <- cca(dune ~ A1 + Moisture + Management, dune.env)
plot(mod, type="n")
text(mod, dis="cn")
points(mod, pch=21, col="red", bg="yellow", cex=1.2)
text(mod, "species", col="blue", cex=0.8)
## Limited output of 'summary'
head(summary(mod), tail=2)
## Scaling can be numeric or more user-friendly names
## e.g. Hill's scaling for (C)CA
scrs <- scores(mod, scaling = "sites", hill = TRUE)
## or correlation-based scores in PCA/RDA
scrs <- scores(rda(dune ~ A1 + Moisture + Management, dune.env),
               scaling = "sites", correlation = TRUE)


