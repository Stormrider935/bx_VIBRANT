FROM continuumio/miniconda3
RUN apt-get update && apt install -y  git gzip tar wget && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN conda config --add channels conda-forge && \
    conda config --add channels bioconda && \
    conda config --add channels default



RUN conda install -c bioconda vibrant==1.0.1 scikit-learn==0.21.3
# RUN cd /opt/conda/share/vibrant-1.0.1/databases/ && python3 VIBRANT_setup.py && python3 VIBRANT_test_setup.py

# RUN git clone https://github.com/AnantharamanLab/VIBRANT.git
# RUN chmod 777 /VIBRANT/*
# ENV PATH /VIBRANT:$PATH
# RUN cd /VIBRANT/databases/ && python3 VIBRANT_setup.py && python3 VIBRANT_test_setup.py


# roughly 20 GB