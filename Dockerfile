# Version 0.1
FROM ipython/scipystack

MAINTAINER Abhinav Ajgaonkar <abhinav316@gmail.com>

ENV	DEBIAN_FRONTEND noninteractive

ADD	.	/dvto

RUN	\
	apt-get install -y -qq wget; \
	wget -O - https://s3.amazonaws.com/static.crowdriff.com/dvto/7/dvto7.tbz2 \
	| tar xjf - -C "/dvto"; \
	/usr/local/bin/ipython trust /dvto/bikeshare_model.ipynb;	\
	/usr/local/bin/ipython trust /dvto/intro_to_sklearn.ipynb;	\
	chmod -R 777 /dvto;

WORKDIR	/dvto

CMD ["/usr/local/bin/ipython", "notebook", "--ip='*'"]