FROM thiswind/python

ENV DEBIAN_FRONTEND noninteractive

#RUN apt-get update
#RUN apt-get -y install build-essential python-dev libffi-dev libssl-dev


RUN pip install --upgrade pip
#RUN pip install urllib3[secure]

RUN mkdir /app

COPY app/requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt

COPY app/data.xlsx /app/data.xlsx
COPY app/templates /app/templates
COPY app/app.py /app/app.py

COPY run.sh /run.sh

EXPOSE 5000

CMD ["/run.sh"]
