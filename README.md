# FX Transactions
## Set up
run:

- bundle install
- bin/rails db:setup

## Automated Tests
run:
- bundle exec rspec

## Postman Tests
- Login in postman as an initialized admin/customer users described in authentication service user

OR

- create user and login:

{
	"user" :{
    "first_name":"Jeje",
    "last_name":"Namu",
		"email":"jeje@namu.com",
    "role":"customer",
		"password":"password"
	}
}

- make requests using the returned token as admin/customer user (curl/postman)

* create a transaction 
  POST {{trans-service-url}}/transactions

* get system transactions
  GET {{trans-service-url}}/transactions

* get a specific transaction
  GET {{trans-service-url}}/transactions/:id


NOTE: Admin account gets all the system transactions while customer account can only get related transactions
# Test Coverage
Coverage report generated for RSpec to /bank/coverage.
open /fx_transactions/coverage/index.html on your browser