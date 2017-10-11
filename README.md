# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
Local: 
rails db:schema:dump (this grabs the schema from the existing DB)
Load data from a local backup:
psql -d rgarden -f /Users/aarontaddiken/Downloads/RgardenDB.sql

# HEROKU Setup

Making backup file:

pg_dump -U USERNAME DATABASE --no-owner --no-acl -f backup.sql 
Restoring from sql file to heroku :

heroku pg:psql --app APPNAME < backup.sql 
--Actual: heroku pg:psql --app shielded-peak-87906 < /Users/aarontaddiken/DownloadRgarden-Postgres-DB.sql

(Bonus) Deleting all tables from heroku app database (example):

heroku pg:reset --app APPNAME HEROKU_POSTGRESQL_ROSE (Ours: postgresql-triangular-96950)

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
