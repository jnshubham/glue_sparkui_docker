FROM alpine
LABEL maintainer="Shubham Jain <shubhamakachamp@gmail.com>"
RUN apk add --no-cache openjdk8
RUN apk add --no-cache maven
RUN apk add --no-cache bash
RUN mkdir sparkui
WORKDIR sparkui
RUN wget https://archive.apache.org/dist/spark/spark-2.4.3/spark-2.4.3-bin-without-hadoop.tgz
RUN mv spark-2.4.3-bin-without-hadoop.tgz spark
RUN tar -zxf spark
RUN rm -rf spark
RUN mv spark-2.4.3-bin-without-hadoop/ spark/
COPY pom.xml .
RUN mvn dependency:copy-dependencies -DoutputDirectory=/sparkui/spark/jars/
RUN apk del maven
RUN rm /sparkui/spark/jars/servlet-api-2.5.jar && \
    rm /sparkui/spark/jars/jsr305-1.3.9.jar && \
    rm /sparkui/spark/jars/jersey-*-1.9.jar
RUN echo $'\n\
spark.eventLog.enabled                      true\n\
spark.history.ui.port                       18080\n\
' > /sparkui/spark/conf/spark-defaults.conf

ENTRYPOINT ["/sparkui/spark/bin/spark-class", "org.apache.spark.deploy.history.HistoryServer"]