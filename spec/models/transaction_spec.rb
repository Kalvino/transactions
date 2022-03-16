require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:transaction) { create(:transaction) }

  describe 'validation' do
    it { should validate_presence_of(:customer_id) }
    it { should validate_presence_of(:input_amount) }
    it { should validate_presence_of(:input_currency) }
    it { should validate_presence_of(:output_amount) }
    it { should validate_presence_of(:output_currency) }
  end

  describe 'transaction_id generation' do
    it 'will have a transaction_id automatically assigned during creation' do
      expect(transaction.transaction_id).to_not be_nil
    end
  end
end
