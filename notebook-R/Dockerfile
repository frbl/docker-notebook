FROM jupyter/all-spark-notebook
USER root
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libssl-dev \
    ed \
    libnlopt0 \
    zlib1g-dev && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Apparently, R references the wrong tar command (Similar: https://github.com/rstats-db/RPostgres/issues/110)
RUN ln -s /bin/tar /bin/gtar

USER $NB_USER
