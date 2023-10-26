FROM python:3.8
USER root

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y libgl1-mesa-dev
RUN apt-get -y install locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

RUN mkdir /code
WORKDIR /code
COPY ./requirements.txt /code
RUN apt-get update && apt-get -y upgrade
RUN pip install --upgrade pip && pip install -r requirements.txt

RUN python -m pip install jupyterlab

ADD . /code/

