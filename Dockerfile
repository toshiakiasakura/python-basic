FROM jupyter/scipy-notebook:584f43f06586

WORKDIR /workdir
EXPOSE 8888

# jupyter lab extensions. 
RUN conda install -c conda-forge jupyterlab-snippets && \
    conda install -c conda-forge jupyterlab-git -y && \
    jupyter lab build

# python package installation. 
RUN pip install japanize-matplotlib && \
    pip install ipynb_path && \
    pip install mojimoji && \
    pip install Levenshtein 

RUN pip install jupyterlab_vim

# sphinx setting
RUN conda install sphinx -y && \
    pip install sphinx-autodoc-typehints

# install vim 
#RUN apt-get update && \
#    apt-get install -y vim

#RUN sudo echo "alias jpt_lab='jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root '" >> /root/.bashrc

