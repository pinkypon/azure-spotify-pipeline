FROM astrocrpublic.azurecr.io/runtime:3.2-5

USER root

RUN apt-get update && apt-get install -y curl gnupg2 && \
  curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | \
  gpg --dearmor > /usr/share/keyrings/microsoft-prod.gpg && \
  echo "deb [arch=arm64 signed-by=/usr/share/keyrings/microsoft-prod.gpg] https://packages.microsoft.com/debian/12/prod bookworm main" > /etc/apt/sources.list.d/mssql-release.list && \
  apt-get update && \
  ACCEPT_EULA=Y apt-get install -y msodbcsql18 unixodbc-dev && \
  apt-get clean

USER astro