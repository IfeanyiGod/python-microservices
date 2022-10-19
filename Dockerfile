FROM python:3.10.0-alpine3.15
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY src src
EXPOSE 5000
HEALTHCHECK --interval=30s --retries=5 --start-period= --timeout=30s \ 
    CMD curl -f http://localhost:5000/health || exit 1
ENTRYPOINT ["python3", "./src/app.py"]