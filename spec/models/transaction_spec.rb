require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:transaction) { create(:transaction) }
  let(:invalid_transaction) { create(:transaction, :invalid_transaction) }

  describe 'validation' do
    it { should validate_presence_of(:transaction_id) }
    it { should validate_presence_of(:customer_id) }
    it { should validate_presence_of(:input_amount) }
    it { should validate_presence_of(:input_currency) }
    it { should validate_presence_of(:output_amount) }
    it { should validate_presence_of(:output_currency) }

    expect(:invalid_transaction).to_not be_valid
  end
end
