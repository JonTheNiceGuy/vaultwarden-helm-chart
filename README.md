# Deploying Vaultwarden to Kubernetes with Skaffold, Helm and Sops

This repo was created to support a wider blog article. It consumes:

1. [Vaultwarden](https://github.com/dani-garcia/vaultwarden)
2. [vwmetrics](https://github.com/tricked-dev/vwmetrics)
3. [vaultwarden-sync](https://github.com/JonTheNiceGuy/vaultwarden-sync)
4. [vaultwarden-backup](https://github.com/JonTheNiceGuy/vaultwarden-backup)

It assumes deployment with Skaffold and Helm, using SOPS for secret storage, an external Postgresql (e.g. RDS) for your database, KMS for encryption (although any SOPS compatible encryption will be suitable) and S3 as your backup destionation.