FROM python:3

MAINTAINER mmclaughlin@koinpayments.com

COPY requirements.txt ./
COPY flask-template.py ./app.py
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 80

CMD [ "python","./app.py" ]