FROM jupyter/scipy-notebook
USER root

RUN mkdir -p work/oracle

COPY instantclient/* work/oracle/

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    alien\
    zlib1g-dev && \
    alien -iv work/oracle/oracle-instantclient12.2-basiclite-12.2.0.1.0-1.x86_64.rpm && \
    alien -iv work/oracle/oracle-instantclient12.2-devel-12.2.0.1.0-1.x86_64.rpm && \
    rm -rf work/oracle/oracle*.rpm

ENV ORACLE_HOME=/usr/lib/oracle/12.2/client64
ENV LD_LIBRARY_PATH=$ORACLE_HOME/lib
ENV PATH=$ORACLE_HOME/bin:$PATH

# Install python dependencies
COPY requirements.txt requirements.txt
RUN apt-get install -y --no-install-recommends libaio1 && \ 
    pip install -r requirements.txt &&\
    apt-get purge -y alien perl perl5 && apt-get -y autoremove && apt-get clean && \
    rm -rf /var/lib/apt/lists/*  && rm -rf /usr/share/docs && rm -rf /usr/share/man 

USER $NB_USER
