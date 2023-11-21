FROM python:3.9-alpine
ENV PIP_ROOT_USER_ACTION=ignore
ENV LISTENER_ADDRESS=0.0.0.0
ENV INPUT_FILE_PATH=/app/data/users.xlsx
ENV OUTPUT_FILE_PATH=/app/data/output.xlsx
ENV ADMIN_PASSWORD=1234
ENV DOMAIN_NAME=http://127.0.0.1:8000
ENV PAGE_TITLE='QR Ticket'
ENV EVENT_NAME='Your Event Name' 
RUN apk add --no-cache git openssh-client ca-certificates bash 
COPY ./src/requirements.txt /app/src/requirements.txt
VOLUME /app/data
WORKDIR /app/src
RUN pip install --no-cache-dir -q --upgrade pip && \
    pip install --no-cache-dir -q --upgrade -r requirements.txt
RUN adduser -D python 
RUN chown -R python:python /app
USER python
COPY --chown=python:python ./src /app/src
RUN sed -i -e"s/127.0.0.1/${LISTENER_ADDRESS}/" /app/src/webserver.py
COPY --chown=python:python ./templates /app/templates
COPY --chown=python:python ./bootstrap.sh /app/src
#CMD ["python", "main.py" , "run_webserver"]
CMD ["./bootstrap.sh"]
EXPOSE 8000

