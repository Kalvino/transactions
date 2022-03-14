require 'rails_helper'

RSpec.describe 'Transaction ID' do
  describe 'generation' do
    it 'can be created' do
      id = TransactionId.generator
      expect(id).to be_kind_of(String)
    end
  end
end
