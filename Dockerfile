FROM ubuntu:17.10

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    default-jre\
    wget\
    git

RUN pip3 install py4j \
    jupyter \
    matplotlib \
    pandas \
    sklearn

RUN cd /tmp/;\
    wget https://d3kbcqa49mib13.cloudfront.net/spark-2.1.1-bin-hadoop2.7.tgz \
    -nv;\
    mkdir /opt/spark;\
    cd /opt/spark/;\
    tar -xzf /tmp/spark-2.1.1-bin-hadoop2.7.tgz;\
    rm /tmp/spark-2.1.1-bin-hadoop2.7.tgz;\
    mkdir /nbhome

WORKDIR /nbhome

ENV PYSPARK_PYTHON "python3"
ENV PYTHONPATH "/opt/spark/spark-2.1.1-bin-hadoop2.7/python"

COPY run.sh ./

EXPOSE 8888
CMD ["sh", "run.sh"]
