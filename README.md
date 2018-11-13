# Tech Team Berlin - Backend Coding Challenge

 A Ruby On Rails application that pulls data from the SpaceX API and stores them in a PostgreSQL database and expose it via APIs documented below.

## Tools and versions

```
ruby 2.4.1

Rails 5.1.6

Gem 2.6.14

postgres (PostgreSQL) 10.5

git version 2.17.1

```

### Prerequisites

To run the system you need to have Ruby, Rails and Postgres installed on your system. 

In case you are using mac: 

* [PostgreSQL](https://www.elliotblackburn.com/installing-postgresql-on-macos-osx/) - for Mac
* [Ruby](https://www.ruby-lang.org/en/documentation/installation/) - choose your OS
* [Rails](https://guides.rubyonrails.org/getting_started.html)
* [Git](https://guides.rubyonrails.org/getting_started.html)


### Setup Process

To run the app, enter the commands below in terminal. 

```
git clone https://github.com/raimable/techteamberlin_backend_challenge.git

cd techteamberlin_backend_challenge

rails db:create #To create database in postgres as per the config

rails db:migrate #To run the migrations 

rails server #To start the server

```

## Configuring SpaceX API URL

The app is pre-configured to fetch data from https://api.spacexdata.com/v3/ . If you want to change the URL or end-points , you may edit it in config/intializers/spacex.rb .

```
Rails.application.config.x.space_x_api_missions_url = '<FULL URL FOR MISSIONS END POINT>'
Rails.application.config.x.space_x_api_payloads_url = '<FULL URL FOR PAYLOADS END POINT>'
```


## JSON API End Points 

Open your favourite REST API tester application (mine is Postman) and open the following URLs:

### To fetch Data from SpaceX synchronousely


```
localhost:3000/fetch_data​​?sync=true
```

When this endpoint is called the app would fetch data from the SpaceX API before returning a response to the browser. (Your broswer may seem to take a long time to load). That means all missions, all payloads and all nationalities (from within the payloads) will be downloaded and stored to the potgress database.

### To fetch Data from SpaceX asynchronousely

```
localhost:3000/fetch_data​​
```
When this endpoint is called without 'sync' parameter, we will schedule a background job that will soon fetch all the required data from SpaceX API , in background. If you call this end point multiple times while a prevousely scheuduled job is still running, it WILL NOT cause duplicate entries to be created in the database.

```
{
    "success": true,
    "sync": false,
    "message": "A data fetch is scheduled"
}

```
That means all missions, all payloads and all nationalities (from within the payloads) will be loaded with this API end point.

### Retrieve All Missions OR Single Mission

```
localhost:3000/missions/​​ ​​- return all missions
localhost:3000/missions/:id​​ ​​
```


### Searching for missions with matching description

```
localhost:3000/missions/search​​?query=some-text

Eg: localhost:3000/missions/search?query=Europe
```
Return all missions where a search term that the user submits is found in the missions description.

Note: We use `pg_search` gem to enable search instead of using SQL %LIKE%. That means we search for matching words, not substrings.

### Retrieve all Payloads || Single Payload 

```
localhost:3000/payloads​​ - return all payloads
localhost:3000/payloads/:id​​ - return the payload with this id
```

### Retrieve all Nationalities || Single Nationality 

```
localhost:3000/nationalities​​ - return all nationalities
localhost:3000/nationalities/:id​​ - return the nationality with this id
```

### Payloads for a specific Nationality || Missions for a specific Nationility 

```
localhost:3000/nationalities/:id/payloads​​ - return all payloads for this nationality
localhost:3000/nationalities/:id/missions​​ - return all missions for this nationality

```

## Authors

* **Aimable Rukundo** - *Initial work* - [Aimable](https://github.com/raimable/)

See also the list of [contributors](https://github.com/raimable/techteamberlin_backend_challenge/contributors) who participated in this project.


## Acknowledgments

* Tech Team from Berlin for the challenge
