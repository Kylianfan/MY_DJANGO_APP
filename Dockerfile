# Utiliser une image légère de Python
FROM python:3.10-slim


# Empêcher les invites interactives (utile pour certains packages)
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Installer les dépendances système (si besoin, comme psycopg2, Pillow, etc.)
# RUN apt-get update && apt-get install -y \
#     build-essential \
#     libpq-dev \
#     && rm -rf /var/lib/apt/lists/*

# Copier les dépendances Python et les installer
COPY requirements.txt /app/
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copier le reste de l'application
COPY . /app/

# Exposer le port utilisé par Django
EXPOSE 8000

# Commande de démarrage
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
