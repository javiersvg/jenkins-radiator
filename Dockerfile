FROM python:2-alpine

RUN apk update && \
    apk update && \
    apk add gcc && \
    apk add musl-dev

COPY jenkins_radiator/ jenkins_radiator/

WORKDIR jenkins_radiator/

RUN pip install -r requirements.txt

EXPOSE 8000
CMD ["gunicorn", "-b", "0.0.0.0:8000", "radiator.wsgi:application"]