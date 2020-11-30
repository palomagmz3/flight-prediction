FROM mongo:4.4.2

COPY . .
RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y curl
RUN git clone https://github.com/ging/practica_big_data_2019
#WORKDIR practica_big_data_2019
RUN ./practica_big_data_2019/resources/download_data.sh
RUN mv /practica_big_data_2019/resources/import_distances.sh /practica_big_data_2019
RUN mv /import.sh /practica_big_data_2019
WORKDIR practica_big_data_2019

EXPOSE 27017

CMD ["sh","import.sh"]

