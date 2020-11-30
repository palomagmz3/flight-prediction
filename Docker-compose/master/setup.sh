/opt/bitnami/spark/bin/spark-class org.apache.spark.deploy.master.Master -h master &
sleep 5 &&
spark-submit --class "es.upm.dit.ging.predictor.MakePrediction" --master local --packages org.mongodb.spark:mongo-spark-connector_2.11:2.3.2,org.apache.spark:spark-sql-kafka-0-10_2.11:2.4.0 practica_big_data_2019/flight_prediction/target/scala-2.11/flight_prediction_2.11-0.1.jar