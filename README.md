# Fetch Points Application

REST API to track and update users points. This application includes 3 API endpoints which will allow the user to view payer point balances, add new transactions, and spend their available points.

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

If at any point you are needing to reset your database simply run `rails db:reset`

### Usage
To get the application up and running on a server, run the following command:
```
rails s
```
Then, in your browser open the first link that follows "Listening on"
It should be something like:
```
http://127.0.0.1:3000
# or
http://localhost:3000
``` 

#### API Endpoints
While the server is running, in the command line run the commands below to hit your needed endpoint:

GET Payer Point Balances
Calls to this endpoint will return a list of payers and their associated point balance.

Call:
```
curl http://localhost:3000/payer_balances
```

POST New Transaction
Calls to this endpoint will require you to submit a payer and date as a string and points as an integer. The return value will the transaction you created.

Call:
```
curl -H 'Content-Type: application/json' -d '{"payer":"PEPSICO","points":3300,"date":"2021-07-17T15:30:33"}' http://localhost:3000/add_transaction
```

Return:
```
{"id":7,"payer":"PEPSICO","points":3300,"created_at":"2021-09-14T14:16:48.553Z","updated_at":"2021-09-14T14:16:48.553Z","date":"2021-07-17T15:30:33.000Z"}% 
```

POST Spend Points
Calls to this endpoints will require you to submit points as an integer that you wish to spend. The return will be a list of the subtracted amount of points used per payer.

Call:
```
curl -d "points"=500 http://localhost:3000/spend_points
```

Return:
```
{"DANNON":0,"UNILEVER":0,"MILLER COORS":-500}
```