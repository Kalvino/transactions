FactoryBot.define do
  factory :transaction do
    transaction_id { Faker::Alphanumeric.unique.alphanumeric(number: 13) }
    customer_id { Faker::Number.non_zero_digit }
    input_amount { Faker::Number.number(digits: 10) }
    input_currency { Faker::Currency.code }
    output_amount { Faker::Number.number(digits: 10) }
    output_currency { Faker::Currency.code }

    trait :invalid_transaction do
      customer_id { nil }
      output_currency { nil }
    end
  end
end
