FactoryBot.define do
  factory :transaction do
    # customer_id { Faker::Number.non_zero_digit }
    customer_id { 1 }
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
