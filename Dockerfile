FROM python:3

MAINTAINER mattmackster@gmail.com

COPY requirements.txt ./
COPY flask-template.py ./app.py
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 8000

CMD [ "python","./app.py" ]