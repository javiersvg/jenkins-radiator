FROM python:2-alpine

RUN apk update && \
    apk update

COPY jenkins_radiator/ app/

WORKDIR app/

RUN pip install -r requirements.txt

EXPOSE 8000
CMD ["gunicorn", "-b", "0.0.0.0:8000", "radiator.wsgi:application"]