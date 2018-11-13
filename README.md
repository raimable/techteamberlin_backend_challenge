# Tech Team Berlin - Backend Coding Challenge

 App that pulls data from the SpaceX API and stores them in a PostgreSQL database.

## Tools and versions

```
ruby 2.4.1

Rails 5.1.6

Gem 2.6.14

postgres (PostgreSQL) 10.5

git version 2.17.1

```

### Prerequisites

To run the system you need to have ruby, rails and postgres install in your system. 

In case you are using mac: 

* [PostgreSQL](https://www.elliotblackburn.com/installing-postgresql-on-macos-osx/) - for Mac
* [Ruby](https://www.ruby-lang.org/en/documentation/installation/) - choose your OS
* [Rails](https://guides.rubyonrails.org/getting_started.html)
* [Git](https://guides.rubyonrails.org/getting_started.html)


### Setup Process

To install the app follow the following steps go to command line, and change directory to where you want to store the project and run the following commands: 

```
git clone https://github.com/raimable/techteamberlin_backend_challenge.git

cd techteamberlin_backend_challenge

rails db:create #To create database in postgres as per the config

rails db:migrate #To run the migrations 

rails server #To start the server

```


## JSON API End Points 

Open your favorit API test (I used Postman) and run the following command:

### Syncronious Load Data  

when this endpoint is called the app should fetch data from the SpaceX API. That means all missions, all payloads and all nationalities (from within the payloads).

```
localhost:3000/fetch_data​​ 
```

### Asyncronious Load Data  

When this endpoint is called the app should fetch data from the SpaceX API. That means all missions, all payloads and all nationalities (from within the payloads).

```
localhost:3000/fetch_data​​?sync=false
```

### Load All Missions OR Single Mission

```
localhost:3000/missions/​​ ​​- return all missions
localhost:3000/missions/:id​​ ​​
```


### Mission Search

```
localhost:3000/missions/search​​?query=some-text
```
Return all missions where a search term that the user submits is
found in the missions description.

### Load All Payload || Single Payload 

```
localhost:3000/payloads​​ - return all payloads
localhost:3000/payloads/:id​​ - return the payload with this id
```

### Load All Nationalities || Single Nationality 

```
localhost:3000/nationalities​​ - return all nationalities
localhost:3000/nationalities/:id​​ - return the nationality with this id
```

### Payloads for Specific Nationality || Missions for Specific Nationility 

```
localhost:3000/nationalities/:id/payloads​​ - return all payloads for this nationality
localhost:3000/nationalities/:id/missions​​ - return all missions for this nationality

```

## Authors

* **Aimable Rukundo** - *Initial work* - [Aimable](https://github.com/raimable/)

See also the list of [contributors](https://github.com/raimable/techteamberlin_backend_challenge/contributors) who participated in this project.


## Acknowledgments

* Tech Tem from Berlin for the challenge
