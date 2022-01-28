# ProxyCrawl Test

Welcome to ProxyCrawl test, if you haven't applied for a job offer yet, please do so before starting the test by emailing us at `jobs at proxycrawl dot com`

## Instructions

1. Clone/fork this repository.
2. Read [Project to Build](#project-to-build) section to see what you have to build in the test.
3. Make commits to the repository like you would normally do on your daily job.
4. Once you are done, if you've forked this project, you can send us the link to the Github project. If you haven't, you can send us the zip file of the project (make sure it includes the `.git` folder).

## Project to build

Create an application using NodeJS or Ruby (depending on the job offer you've applied) that scrapes Amazon SERP pages and saves product details in a database using [ProxyCrawl Crawling API](https://proxycrawl.com/docs/crawling-api).

*Please create a free account if you haven't done so yet, the first 1000 requests are free of charge, if you need more free requests please ask the person in charge of your role application.*

The application must process a list of Amazon SERP URLs and crawl them using the ProxyCrawl API. The data has to be stored in a SQL database (MySQL, SQLite, etc.) and you should save as much information as you want to make the database rich for each Amazon product if it exists in the DB, do not store it again. The information must be crawled using the [ProxyCrawl Crawling API](https://proxycrawl.com/dashboard/docs).

### Important notes to follow

1. The crawling of the Amazon SERP pages has to be done in **background jobs** (ex. to push the URLs to a queue and crawl them as background jobs).
1. The crawling project should run every week on Monday at 10:00 AM through a predefined scheduler (ex. Same URLs have to be crawled every week and the product info has to be updated accordingly)
1. The parsing of the raw HTML pages has to be done internally in the project and not to rely on ProxyCrawl API built in scrapers.
1. Implement **CRUD operations** through a **REST API** which is accessed externally with basic authentication, that should do -- it creates, reads, updates, and deletes (CRUD) data from a database in response to a given HTTP request, and provides a suitable JSON response.

## Important notes

- This project is to showcase your skills, so try to do it as best as you can.
- You don't have restrictions on libraries or frameworks to use for the test, that is up to you. But don't forget that we want to see your skills, not the ones of the guys from the libraries, so do it wisely ;)
- We should be able to run the test and try it. If there are setup instructions please include them in this README file.
- There are no restrictions, limits, or instructions on the frontend part. We want to see your creativity!
- The test is not time metered but we don't want you to use more than 5 hours on it.
- If you have any questions, don't hesitate to contact the person in charge of your application.

## Project created by Shiraz

### Prerequisite
1- Ruby 3.0.2.

2- Rails 6.1.4.

3- Mysql.

4- Redis server

5- Sidekiq

### Installation

Follow these easy steps to run the project locally:

#### Clone the repository
```
git clone git@github.com:shirazhaider2016/proxycrawl-interview-test.git
```
#### Install the app

```
bundle install
yarn install
rails db:create
rails db:migrate
rails s #in one tab
./bin/webpack-dev-server #in second tab
```

Run the following command to start the redis server

```
redis-server
```
Run the following command in the terminal to start the sidekiq

```
bundle exec sidekiq
```

to check sidekiq running open link in browser

```
http://localhost:3000/sidekiq
```

## When every thing is running

i use whenever gem for scheduling job that run every monday at 10:00 am and created rake task that call sidekiq worker to run in background.

####commands run on terminal to check cronjobs local:

```
1- crontab -r (to clear cronjobs)

2- whenever --update-crontab --set environment='development'

3- crontab -l (to check cronjobs)
```


####commands to run task directly:

```
bundle exec rake proxycrawl:crawl_amazon_serp
```

## Frontend GUI for Products and Amazon Urls
Added basic auth in local after running project goto url http://localhost:3000 and hit
 
1- username = proxycrawl

2- password = proxycrawl

Api token is added in env file

## Model/Tables

1- Product (stores crawl and api data)

2- AmazonUrl (store urls with title to crawl)

##Screenshots

Goto documents folder and you will find screenshots and json collections

![alt text](https://github.com/shirazhaider2016/proxycrawl-interview-test/blob/master/documents/1.png?raw=true)

![alt text](https://github.com/shirazhaider2016/proxycrawl-interview-test/blob/master/documents/2.png?raw=true)

![alt text](https://github.com/shirazhaider2016/proxycrawl-interview-test/blob/master/documents/3.png?raw=true)

![alt text](https://github.com/shirazhaider2016/proxycrawl-interview-test/blob/master/documents/4.png?raw=true)

![alt text](https://github.com/shirazhaider2016/proxycrawl-interview-test/blob/master/documents/5.png?raw=true)

    
##API Documentation link

#### Amazon Url API collection
```
https://www.getpostman.com/collections/84db32c8b7e3a76ae3f0
```
[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/3894187-2f4a87b4-fe68-4db5-9cdc-6ec1a2bb0c97?action=collection%2Ffork&collection-url=entityId%3D3894187-2f4a87b4-fe68-4db5-9cdc-6ec1a2bb0c97%26entityType%3Dcollection%26workspaceId%3D44d4ef6d-04a9-46ee-9e3e-83e9bf62ac0f)

#### Product API collection

```
https://www.getpostman.com/collections/12da8dc003106265476e
```
[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/3894187-ddc370b1-dbd7-4c4d-a386-e5baf901eddd?action=collection%2Ffork&collection-url=entityId%3D3894187-ddc370b1-dbd7-4c4d-a386-e5baf901eddd%26entityType%3Dcollection%26workspaceId%3D44d4ef6d-04a9-46ee-9e3e-83e9bf62ac0f)