FROM bitnami/spark:2.4.4
USER root
RUN mkdir /practica
WORKDIR /practica
COPY . . 

#Instalación de herramientas
RUN apt-get update
RUN apt-get install -y vim python3-pip git zip
RUN apt-get install -y curl

#Instalación repositorio y configuración inicial
#Estamos inicialmente en /opt/bitnami/spark
RUN git clone https://github.com/ging/practica_big_data_2019
RUN practica_big_data_2019/resources/download_data.sh
RUN pip install -r /practica/practica_big_data_2019/requirements.txt
#CMD ["python3", "/opt/bitnami/spark/practica_big_data_2019/resources/train_spark_mllib_model.py", "."]

#Copia de archivos con las rutas necesarias
RUN cp /practica/MakePrediction.scala /practica/practica_big_data_2019/flight_prediction/src/main/scala/es/upm/dit/ging/predictor
RUN cp /practica/predict_flask.py /practica/practica_big_data_2019/resources/web
RUN cp -r /practica/models /practica/practica_big_data_2019
RUN cp -r /practica/target /practica/practica_big_data_2019/flight_prediction
#RUN mv setup.sh practica_big_data_2019/flight_prediction

CMD ["sh","setup.sh"]