class Transaction < ApplicationRecord
  validates :transaction_id, presence: true, uniqueness: true
  validates :customer_id, presence: true
  validates :input_amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :input_currency, presence: true, length: { is: 3 }
  validates :output_amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :output_currency, presence: true, length: { is: 3 }
end
