# PREDICTOR DE VUELOS 🚀
---

Pasos previos al despliegue de la práctica de predicción de vuelos: 

Escoger una de las dos siguientes opciones:

  a. Descargar y extraer en una carpeta local el zip subido a moodle en el que están todos los archivos necesarios. <br>
  b. Clonar el repositorio en una carpeta local a través del siguiente comando: 
	
```
git clone https://github.com/palomagmz3/flight-prediction.git
```

Situarse en la carpeta en la que esté la práctica desde la consola de comandos del dispositivo.

## _DESPLIEGUE MEDIANTE KUBERNETES EN GOOGLE CLOUD_ 🛠️

Ir a la carpeta Kubernetes, y comprobar que se encuentran todos los archivos deployment.yaml y service.yaml de las diferentes tecnologías: mongo, kafka, mongo-express, spark máster y worker, zookeeper y flask.

* Iniciar sesión en una cuenta en Google Cloud.
* En el menú, ir al apartado Compute y seleccionar “Kubernetes Engine”. Se abrirá otro menú y pincharemos en “Clústeres”.
* Seleccionaremos “Crear Clúster”, donde daremos un nombre al clúster, con ubicación en una zona europea (europe-west1-b, por ejemplo), dejando el resto de parámetros los que vienen por defecto.
* Se habrá creado un clúster con 3 nodos (en caso de querer cambiar este tamaño podemos ejecutar 
``` 
gcloud container clusteres resize $NOMBRE-CLUSTER --num-nodes=$NUMERO DE NODOS --region $ZONA-ELEGIDA 
``` 
Para conectarnos con él ejecutamos en el terminal de Google el siguiente comando: 
``` 
gcloud container clústeres get-credentials \ $NOMBRE-CLUSTER --zone $ZONA-ELEGIDA 
```
(el botón “conectar” que aparece a la derecha del clúster nos dice exactamente qué comando tenemos que ejecutar. 
* Ahora ya podemos subir desde el terminal los archivos deployment.yaml y service.yaml de la carpeta Kubernetes.
* Para desplegar el servicio de predicción de vuelos ejecutaremos el comando: 
``` 
kubectl apply -f $FICHERO.yaml 
```
con cada uno de los ficheros ‘deployment’ y ‘service’ anteriores.
* Ejecutando 
``` 
kubectl get services 
``` 
podremos ver la ip externa de flask para acceder al navegador del predictor de vuelos. Si todo lo anterior lo hemos realizado correctamente el servicio estará disponible en la siguiente dirección: http://$IP-SERVICIO-FLASK:5000/flights/delays/predict_kafka



## _DESPLIEGUE MEDIANTE DOCKER-COMPOSE_ 🛠️

Ir a la carpeta Docker-compose, en ésta se encuentran: 
* El archivo **docker-compose.yml**: fichero de configuración de los servicios de nuestra aplicación (master, worker, mongo-express, mongo, kafka, zookeeper, flask).
* Directorio **Master**: En él está el Dockerfile que crea una imagen nueva a partir de una imagen de Spark (ya existente), MakePrediciton.scala (con alguna ruta o path cambiada acorde a dónde se encuentra la práctica dentro de nuestro contenedor), targets y models (carpetas que se crean a partir del sbt y entrenar el modelo de predicción con train_spark_mllib_models.py, respectivamente). 
* Directorio **Mongo**: Al igual que en Master, existe un Dockerfile que crea una imagen para poder almacenar los datos existentes en nuestra base de datos ‘agile_data_science’, un archivo setup.sh, que se ejecuta con la última sentencia del Dockerfile y que importa el archivo ‘origin_dest_distances.jsonl’, nuestro dataset. 
* Directorio **Flask**: Además de un Dockerfile, también se compone de la aplicación web ‘predict_flask.py’. 

Introducir el siguiente comando en la consola:
``` 
docker-compose up 
``` 

Abrir un navegador web y entrar en la página: http://localhost:5000/flights/delays/predict_kafka .
En esta página se puede ver una interfaz gráfica en la que puede insertar parámetros a su gusto y ver el retraso del vuelo al clickear en el botón submit.

## Autores ✒️

_Los que ayudaron a levantar el proyecto desde sus inicios_ ❤️

* **Sylwia Kazmierczyk** - s.kazmierczyk@alumnos.upm.es
* **Paloma Gómez Gómez** - paloma.gomez.gomez@alumnos.upm.es
