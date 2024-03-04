FROM python:3.8-slim

WORKDIR /app

COPY requirements.txt requirements.txt

RUN apt-get update && \
    apt-get install -y gcc g++ build-essential && \
    apt-get install -y pkg-config default-libmysqlclient-dev

RUN pip3 install -r requirements.txt

COPY . .

EXPOSE 80
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0", "--port=80"]