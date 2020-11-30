FROM tiangolo/uwsgi-nginx-flask:python3.6-2020-08-16
RUN mkdir /practica
WORKDIR /practica
COPY . .

RUN apt-get update
RUN apt-get install -y vim python3-pip git zip
RUN apt-get install -y curl
RUN git clone https://github.com/ging/practica_big_data_2019
RUN pip install -r /practica/practica_big_data_2019/requirements.txt

#Copia predict_flask
RUN cp /practica/predict_flask.py /practica/practica_big_data_2019/resources/web

WORKDIR /practica/practica_big_data_2019/resources/web
CMD ["python3", "predict_flask.py"]
