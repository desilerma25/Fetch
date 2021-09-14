# Fetch Points Application

REST API to track and update users points.

### Getting started
This application was created with Ruby version 2.6.1 and Rails version 6.1.4.1. To check your version run the commands below in your terminal.

```
ruby -v
rails -v
```

To install all necessary gems for the application run the following:
```
bundle install
```

### Database creation and initialization
This application is utilizing Postgresql as the database for ActiveRecord. To create and initialize the database run the following commands:
```
rails db:create
rails db:migrate
```

To utilize seeded data run the following:
```
rails db:seed
```

### Usage
To get the application up and running on a server run the following command:
```
rails s
```
Then, in your browser open the first link that follows "Listening on"
It should be something like
```
http://127.0.0.1:3000
``` 

