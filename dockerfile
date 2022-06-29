## Docker image to host a Django application with an Apache2 webserver
FROM python:latest AS builder
WORKDIR /app/
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1 
COPY ./requirements.txt /app/requirements.txt
RUN apt-get update && apt-get upgrade -y
RUN pip install --upgrade pip
RUN pip install -r requirements.txt --no-cache
COPY ./ /app/

 
FROM ubuntu/apache2:latest 
WORKDIR /apache
RUN rm -rf ./*
EXPOSE 8080
COPY --from=builder /app/build/. .
CMD ["python" ,"manage.py" ,"runserver" ,"0.0.0.0:8000"]
