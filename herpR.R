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
                ## 


save.image("~/1.USFQ/TESIS/HERPETO/HERPETO/herpRworkspace.RData")
