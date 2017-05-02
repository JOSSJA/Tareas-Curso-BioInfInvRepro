#Este script corre desde la carpeta Prac_Uni/maices/bin del repositorio
#Este script responde la primera pregunta de mi tarea 

#Cargar en una df llamada fullmat el archivo
fullmat<-read.delim("../meta/maizteocintle_SNP50k_meta_extended.txt")

#¿Qué tipo de objeto creamos al cargar la base?
class(fullmat)

#¿Cómo se ven las primeras 6 líneas del archivo?
head(fullmat,n=6)

#¿Cuántas muestras hay?   
nrow(fullmat)
#Respuesta = 165

#¿De cuántos estados se tienen muestras?
estados<- unique (fullmat$Estado)
length (estados)
#Respuesta = 19


#¿Cuántas muestras fueron colectadas antes de 1980?
edad<- fullmat[[10]]
antes1980<- as.data.frame (edad<1980)
sum (antes1980[[1]], na.rm=TRUE)
#respuesta = 8

#¿Cuántas muestras hay de cada raza?
table(fullmat$Raza)

#En promedio, ¿A qué altitud fueron colectadas las muestras?
altitud<-fullmat$Altitud
mean(altitud)
#Respuesta = 1519.242

#¿Y a qué altitud máxima y mínima fueron colectadas?
max(altitud)
min(altitud)
# Respuesta = 5 y 2769

#Crea una nueva df de datos sólo con las muestras de la raza Olotillo
samplesOlotillo<-fullmat[fullmat$Raza == "Olotillo",]

#Crea una nueva df de datos sólo con las muestras de la raza Reventador, Jala y Ancho
RevenJalaAncho=fullmat[fullmat$Raza == "Reventador" | Raza == "Jala" | Raza == "Ancho" ,]

#Escribe la matriz anterior a un archivo llamado "submat.cvs" en /meta
write.csv(RevenJalaAncho, file="../meta/submat.cvs")