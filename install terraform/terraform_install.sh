#!/bin/bash
# Ce script installe Terraform sur Ubuntu en utilisant un trousseau de clés

set -e

echo "Mise à jour de la liste des paquets..."
sudo apt-get update

echo "Installation des dépendances nécessaires..."
sudo apt-get install -y gnupg curl software-properties-common

echo "Téléchargement de la clé GPG de HashiCorp et stockage dans le trousseau de clés..."
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

echo "Ajout du dépôt HashiCorp dans la liste des sources..."
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

echo "Mise à jour de la liste des paquets..."
sudo apt-get update

echo "Installation de Terraform..."
sudo apt-get install -y terraform

echo "Installation terminée. Version de Terraform installée :"
terraform version
