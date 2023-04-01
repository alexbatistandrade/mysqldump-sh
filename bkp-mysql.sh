#!/bin/bash
# Configurações do backup
user="use"                              # Usuário do banco de dados MySQL
password="sua_senha"                    # Senha do banco de dados MySQL
host="localhost"                        # Host do banco de dados MySQL
db_name="dbname"                        # Nome do banco de dados MySQL
backup_dir="/home/backup"               # Diretório onde será salvo o backup
date=`date +%d-%m-%Y`                   # Data atual no formato "dia-mês-ano"
backup_tar_name="$db_name-$date.tar.gz" # Nome do arquivo tar.gz

# Cria o arquivo de backup
echo "Iniciando backup do banco de dados..."
mysqldump --user=$user $db_name > $backup_dir/$db_name-$date.sql

# Compacta o arquivo de backup
echo "Compactando o arquivo de backup..."
cd /home/backup/
tar -czvf $backup_tar_name $db_name-$date.sql

# Teste de integridade do arquivo tar.gz
#echo "Testando a integridade do arquivo"
gunzip -c *tar.gz | tar t > /dev/null

# Remove o arquivo de backup original
#echo "Removendo arquivo de backup original..."
rm $backup_dir/$db_name-$date.sql

#echo "Backup do banco de dados concluído com sucesso!"

