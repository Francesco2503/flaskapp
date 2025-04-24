# Usa un'immagine base con Python 3 (slim per avere meno dimensioni)
FROM python:3.13-slim

# Imposta la directory di lavoro nel container
WORKDIR /app

# Copia i file di progetto nel filesystem del container
COPY requirements.txt ./
COPY app.py ./

# Installa le dipendenze Python
RUN pip install -r requirements.txt

# Espone la porta 5000 (facoltativo, per documentazione)
EXPOSE 5000

# Comando di avvio: esegue l'app Flask
CMD ["python", "app.py"]