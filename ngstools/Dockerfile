
FROM antiguos/miniconda3

ADD ./environment.yml /

RUN conda env update \
	&& conda clean -a -y

CMD [ "/bin/bash" ]


#  $ docker build . -t antiguos/ngstools:latest -t antiguos/ngstools:1.0
#  $ docker run --rm -it antiguos/ngstools:latest /bin/bash
#  $ docker push antiguos/ngstools:latest
#  $ docker push antiguos/ngstools:1.0