FROM continuumio/miniconda3
RUN apt-get update && apt install -y  git wget && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN conda config --add channels conda-forge && \
    conda config --add channels bioconda && \
    conda config --add channels default



RUN conda install -c bioconda vibrant

RUN git clone https://github.com/AnantharamanLab/VIBRANT.git
ENV PATH /VIBRANT:$PATH
RUN cd /VIBRANT/databases/ && python3 VIBRANT_setup.py && python3 VIBRANT_test_setup.py
