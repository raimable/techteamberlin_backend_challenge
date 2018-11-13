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


### Installing

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


```
localhost:3000/fetch_data​​ - when this endpoint is called the app should fetch data from the SpaceX API. That means all missions, all payloads and all nationalities (from within the payloads).
localhost:3000/missions/​​ ​​- return all missions
localhost:3000/missions/:id​​ ​​- return the mission with this id.
localhost:3000/missions/search​​ ​​- return all missions where a search term that the user submits is
found in the missions description.
localhost:3000/payloads​​ - return all payloads
localhost:3000/payloads/:id​​ - return the payload with this id
localhost:3000/nationalities​​ - return all nationalities
localhost:3000/nationalities/:id​​ - return the nationality with this id
localhost:3000/nationalities/:id/payloads​​ - return all payloads for this nationality
localhost:3000/nationalities/:id/missions​​ - return all missions for this nationality

```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Aimable Rukundo** - *Initial work* - [Aimable](https://github.com/raimable/)

See also the list of [contributors](https://github.com/raimable/techteamberlin_backend_challenge/contributors) who participated in this project.


## Acknowledgments

* Tech Tem from Berlin for the challenge
