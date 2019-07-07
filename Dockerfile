FROM rocker/verse:3.5.1
MAINTAINER Lino Galiana <lino.galiana@insee.fr>

# WE EXPORT PATH FOR CONDA
ENV PATH="/opt/conda/bin:${PATH}"

# UPDATE A SERIES OF PACKAGES
RUN apt-get update --fix-missing && apt-get install -y ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1 libxml2-dev

# INSTALL PYTHON 3 AND ANACONDA
RUN apt-get install -y python3-pip python3-dev && pip3 install virtualenv \
&& wget --quiet https://repo.anaconda.com/archive/Anaconda3-5.3.0-Linux-x86_64.sh -O ~/anaconda.sh \
&& /bin/bash ~/anaconda.sh -b -p /opt/conda && rm ~/anaconda.sh \
&& ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh \
&& echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc

# CHECK PYTHON VERSION IF WANTED
# RUN python --version

# CHECK PATH IF WANTED
# RUN echo $PATH

# CHECK CONDA
# RUN conda info --envs

# ACTIVATE CONDA ENVIRONMENT
RUN echo "source activate base" > ~/.bashrc

# WRITE RETICULATE_PYTHON VARIABLE IN .Renviron
RUN echo "RETICULATE_PYTHON = '/opt/conda/bin'" > .Renviron


# INSTALL R PACKAGE reticulate
RUN Rscript -e 'install.packages("reticulate")'

# SCRIPT WOULD BE RUN AS:
# RUN Rscript ./build.R
