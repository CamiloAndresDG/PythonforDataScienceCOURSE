
## The Scenario
#In this scenario, you are a junior data analyst working for a hotel booking company. You have been asked to clean a .csv file that was created after querying a database to combine two different tables from different hotels. You have already performed some basic cleaning functions on this data; this activity will focus on using functions to conduct basic data manipulation.

## Step 1: Load packages

# Empiece por instalar los paquetes necesarios. Si ya ha instalado y cargado `tidyverse`,` skimr` y `janitor` en esta sesi�n, no dude en omitir los fragmentos de c�digo en este paso. Esto puede tardar unos minutos en ejecutarse y es posible que aparezca una ventana emergente que le pregunte si desea continuar. Haga clic en s� para continuar instalando los paquetes.
```{r install packages}
install.packages("tidyverse")
install.packages("skimr")
install.packages("janitor")
```

#Once a package is installed, you can load it by running the `library()` function with the package name inside the parentheses:
  
  ```{r load packages}
library(tidyverse)
library(skimr)
library(janitor)
```

## Step 2: Import data

#En el fragmento de abajo, usar� la funci�n `read_csv ()` para importar datos desde un .csv en la carpeta del proyecto llamada "hotel_bookings.csv" y guardarlo como un marco de datos llamado `hotel_bookings`.

#Si esta l�nea causa un error, c�piela en la l�nea setwd ("proyectos / Curso 7 / Semana 3") antes.

# Escriba el nombre del archivo en el lugar correcto para leerlo en su consola R: 
  
  ```{r load dataset}
hotel_bookings <- read_csv("")
```

## Step 3: Getting to know your data

#Como ha estado haciendo en otros ejemplos, utilizar� funciones de resumen para conocer sus datos. Esta vez, completar� los fragmentos de c�digo 
#a continuaci�n para utilizar estas diferentes funciones. Puede utilizar la funci�n `head ()` para obtener una vista previa de las columnas y las 
#primeras filas de datos. Termine el fragmento de c�digo a continuaci�n y ejec�telo:  
 
 ```{r head function}
head()
```
### Practice Quiz 

1. How many columns are in this dataset?
  A: 45
B: 100
C: 32
D: 60

#2. The 'arrival_date_month' variable is chr or character type data.  
A: True
B: False

#Ahora sabe que este conjunto de datos contiene informaci�n sobre reservas de hotel. Cada reserva es una fila en el conjunto de datos y cada columna contiene informaci�n como qu� tipo de hotel se reserv�, cu�ndo se realiz� la reserva y con qu� anticipaci�n tuvo lugar (la columna 'lead_time').

#Adem�s de `head ()` tambi�n puede usar las funciones `str ()` y `glimpse ()` para obtener res�menes de cada columna en sus datos organizados horizontalmente. Puede probar estas dos funciones completando y ejecutando los fragmentos de c�digo a continuaci�n:
  
  ```{r str function}
(hotel_bookings)
```

# Puede ver los diferentes nombres de columna y algunos valores de muestra a la derecha de los dos puntos.

```{r glimpse function}
glimpse()
```

# Tambi�n puede usar `colnames ()` para obtener los nombres de las columnas en su conjunto de datos. Ejecute el fragmento de c�digo a continuaci�n para obtener los nombres de las columnas:

  ```{r colnames function}
colnames(hotel_bookings)
```

## Manipulating your data

# Supongamos que desea organizar los datos por mayor tiempo de espera al menor tiempo de espera porque desea centrarse en las reservas que se realizaron con mucha anticipaci�n. Decide que quiere intentar usar la funci�n `arreglar ()`; ingrese el nombre correcto de la columna despu�s de la coma y ejecute este fragmento de c�digo:

```{r arrange function}
arrange(hotel_bookings, )
```


# �Pero por qu� hay tantos ceros? Esto se debe a que `organizar ()` ordena autom�ticamente en orden ascendente, y usted necesita indicarle espec�ficamente cu�ndo ordenar en orden descendente, como el siguiente fragmento de c�digo a continuaci�n:

  ```{r arrange function descending} 
arrange(hotel_bookings, desc(lead_time))
```

#Ahora est� en el orden que necesitaba. Tambi�n puede hacer clic en las diferentes p�ginas de resultados para ver filas de datos adicionales.

## Practice Quiz
What is the highest lead time for a hotel booking in this dataset?
  A: 737
B: 709
C: 629
D: 0

#Tenga en cuenta que cuando simplemente ejecuta `arrange ()` sin guardar sus datos en un nuevo marco de datos, no altera el marco de datos existente. Compru�belo ejecutando `head ()` nuevamente para averiguar si los tiempos de entrega m�s altos son los primeros:
  
  ```{r head function part two}
head(hotel_bookings)
```

# Esto se aplicar� a todas las funciones que utilizar� en esta actividad. Si quisiera crear un nuevo marco de datos que tuviera esos cambios guardados, usar�a el operador de asignaci�n, <-, como est� escrito en el fragmento de c�digo a continuaci�n para almacenar los datos organizados en un marco de datos llamado 'hotel_bookings_v2':

  ```{r new dataframe}
hotel_bookings_v2 <-
  arrange(hotel_bookings, desc(lead_time))
```

Run `head()`to check it out: 
  
  ```{r new dataframe part two}
head(hotel_bookings_v2)
```

#Tambi�n puede averiguar los plazos de entrega m�ximos y m�nimos sin ordenar todo el conjunto de datos utilizando la funci�n `arrange ()`. Pru�belo usando las funciones max () y min () a continuaci�n:  
 
 ```{r}
max(hotel_bookings$lead_time)
```

```{r}
min(hotel_bookings$lead_time)
```

# Recuerde, en este caso, debe especificar qu� conjunto de datos y qu� columna usando el s�mbolo $ entre sus nombres. Intente ejecutar lo siguiente para ver qu� sucede si olvida una de esas piezas:  
  ```{r}
min(lead_time)
```

#Este es un error com�n que encuentran los usuarios de R. Para corregir este fragmento de c�digo, deber� agregar el marco de datos y el signo de d�lar en los lugares apropiados.

#Ahora, digamos que solo desea saber cu�l es el tiempo de espera promedio para la reserva porque su jefe le pregunta con qu� anticipaci�n debe ejecutar promociones para habitaciones de hotel. Puede usar la funci�n `mean ()` para responder esa pregunta ya que el promedio de un conjunto de n�meros tambi�n es la media del conjunto de n�meros:```{r mean}

mean(hotel_bookings$lead_time)
```

#Deber�a obtener la misma respuesta incluso si usa el conjunto de datos v2 que incluye la funci�n `arreglar ()`. Esto se debe a que la funci�n `arreglar ()` no cambia los valores en el conjunto de datos; simplemente los reorganiza.

```{r mean part two}
mean(hotel_bookings_v2$lead_time)
```

## Practice Quiz 
What is the average lead time?
  A: 100.0011
B: 45.0283
C: 14.0221
D: 104.0114

#Pudiste informarle a tu jefe cu�l es el tiempo de espera promedio antes de reservar, pero ahora ellos quieren saber cu�l es el tiempo de espera promedio antes de reservar solo para los hoteles de la ciudad. Quieren enfocar la promoci�n que est�n realizando dirigi�ndose a las principales ciudades.

#Sabe que su primer paso ser� crear un nuevo conjunto de datos que solo contenga datos sobre hoteles urbanos. Puedes hacerlo usando la funci�n `filter ()` y nombrar tu nuevo marco de datos 'hotel_bookings_city':

```{r filter}
 <- 
  filter(hotel_bookings, hotel_bookings$hotel=="City Hotel")
```

Check out your new dataset:

```{r new dataset}
head(hotel_bookings_city)
```

#Verifica r�pidamente cu�l es el tiempo de entrega promedio para este conjunto de hoteles, tal como lo hizo antes para todos los hoteles:

  ```{r average lead time city hotels}
mean(hotel_bookings_city$lead_time)
```

#Ahora, su jefe quiere saber mucha m�s informaci�n sobre los hoteles de la ciudad, incluido el tiempo de entrega m�ximo y m�nimo. Tambi�n les interesa en qu� se diferencian de los hoteles vacacionales. No desea ejecutar cada l�nea de c�digo una y otra vez, por lo que decide utilizar las funciones `group_by ()` y`summarize () `. Tambi�n puede utilizar el operador de tuber�a para que su c�digo sea m�s f�cil de seguir. Almacenar� el nuevo conjunto de datos en un marco de datos llamado 'hotel_summary':  

  ```{r group and summarize}
hotel_summary <- 
  hotel_bookings %>%
  group_by(hotel) %>%
  summarise(average_lead_time=mean(lead_time),
            min_lead_time=min(lead_time),
            max_lead_time=max(lead_time))
```

Check out your new dataset using head() again:
  
  ```{r}
head(hotel_summary)
```