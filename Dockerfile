FROM python:3.10

WORKDIR /app

COPY requierements.txt /app/

RUN python -m ensurepip --upgrade
RUN pip install --upgrade setuptools
RUN pip install --no-cache-dir -r requierements.txt 

COPY . /app/

EXPOSE 8000

ENTRYPOINT [ "python", "manage.py" ]

CMD ["runserver","0.0.0.0:8000" ]
