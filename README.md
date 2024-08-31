# node-uptime-local

This project is intended to record the uptime and resources usage of a server in local database. I have created another project to centralized monitoring of uptime and resources of some servers. But with this project you will get the idea of how it works.

# Dependencies

1. Ubuntu Linux
2. MySQL
3. Git
4. NodeJS with mysql2, check-disk-space
5. Grafana

# Instalation

## MySQL
`sudo apt install mysql-server`

Disable ONLY_FULL_GROUP in sql_mode:

`SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));`

Set to persistent:

`SET PERSIST sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));`

Don't forget to restart MySQL:

`sudo systemctl restart mysql`

Note: disabling ONLY_FULL_GROUP is need in order to run query in Grafana

## NodeJS

`sudo apt install nodejs`

## Install Git

`sudo apt install git`

# Install node-uptime-local

Clone repository:

`git clone git@github.com:setiodewo/node-uptime-local`

Enter the folder:

`cd node-uptime-local`

Find structure.sql and execute in mysql:

`sudo mysql`

`source structure.sql`

Install dependencies:

`npm install`

Try run the script and check if there are any error messages:

`node uptime.js`

# Create Cronjob

Go to /etc/cron.d :

`cd /etc/cron.d`

Create a file:

`sudo nano uptime`

Paste this line:

`* *     * * *   dewo    node /home/dewo/projects/node-uptime-local/uptime.js >/dev/null 2>&1`

Save with `Ctrl+O`. Exit with `Ctrl+X`.