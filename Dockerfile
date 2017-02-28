FROM python:3.6.0

RUN mkdir /app

COPY app/requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt

COPY app/data.xlsx /app/data.xlsx
COPY app/templates /app/templates
COPY app/app.py /app/app.py

EXPOSE 5000

WORKDIR /app

CMD python app.py runserver -h 0.0.0.0 -p 5000
