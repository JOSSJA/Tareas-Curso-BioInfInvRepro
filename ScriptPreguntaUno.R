#Este script corre desde la carpeta Prac_Uni/maices/bin del repositorio
#Este script responde la primera pregunta de mi tarea 

#Cargar en una df llamada fullmat el archivo
fullmat<-read.delim("../meta/maizteocintle_SNP50k_meta_extended.txt")

#�Qu� tipo de objeto creamos al cargar la base?
class(fullmat)

#�C�mo se ven las primeras 6 l�neas del archivo?
head(fullmat,n=6)

#�Cu�ntas muestras hay?   
nrow(fullmat)
#Respuesta = 165

#�De cu�ntos estados se tienen muestras?
estados<- unique (fullmat$Estado)
length (estados)
#Respuesta = 19


#�Cu�ntas muestras fueron colectadas antes de 1980?
edad<- fullmat[[10]]
antes1980<- as.data.frame (edad<1980)
sum (antes1980[[1]], na.rm=TRUE)
#respuesta = 8

#�Cu�ntas muestras hay de cada raza?
table(fullmat$Raza)

#En promedio, �A qu� altitud fueron colectadas las muestras?
altitud<-fullmat$Altitud
mean(altitud)
#Respuesta = 1519.242

#�Y a qu� altitud m�xima y m�nima fueron colectadas?
max(altitud)
min(altitud)
# Respuesta = 5 y 2769

#Crea una nueva df de datos s�lo con las muestras de la raza Olotillo
samplesOlotillo<-fullmat[fullmat$Raza == "Olotillo",]

#Crea una nueva df de datos s�lo con las muestras de la raza Reventador, Jala y Ancho
RevenJalaAncho=fullmat[fullmat$Raza == "Reventador" | Raza == "Jala" | Raza == "Ancho" ,]

#Escribe la matriz anterior a un archivo llamado "submat.cvs" en /meta
write.csv(RevenJalaAncho, file="../meta/submat.cvs")