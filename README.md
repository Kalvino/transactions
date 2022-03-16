# FX Transactions
## Set up
run:

- bundle install
- bin/rails db:setup

## Automated Tests
run:
- bundle exec rspec

## Postman Tests
- Login in using postman/curl as an initialized admin/customer users described in authentication service user

OR

- create user and login as the user:

{
	"user" :{
    "first_name":"Rapakti",
    "last_name":"Chakilo",
		"email":"rapakti@chakilo.com",
    "role":"customer",
		"password":"password"
	}
}

credentials = {
    "email": "khal1@essacademe.com",
    "password": "password"
}

token = curl -X POST credentials http://localhost:3001

- make requests using the returned token as admin/customer user (curl/postman)

* create a transaction 
  POST {{trans-service-url}}/transactions

  transaction = {
    "transaction" :{
          "customer_id": 2,
          "input_amount": 20,
      "input_currency":"USD",
          "output_amount": "300",
      "output_currency":"KES"
    }
  } 
  
  e.g curl -X POST -d transaction http://localhost:3000/transactions -H "Accept: application/json"
   -H "Authorization: Bearer {token}"


* get system transactions
  GET {{trans-service-url}}/transactions

* get a specific transaction
  GET {{trans-service-url}}/transactions/:id



NOTE: Admin account gets all the system transactions while customer account can only get related transactions
# Test Coverage
Coverage report generated for RSpec to /fx_transactions/coverage.
open /fx_transactions/coverage/index.html on your browser.