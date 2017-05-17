FROM jupyter/all-spark-notebook
USER root
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    zlib1g-dev && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER $NB_USER
