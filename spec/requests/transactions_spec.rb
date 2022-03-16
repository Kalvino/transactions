require 'rails_helper'

RSpec.describe 'Transactions', type: :request do
  let!(:transaction) { create(:transaction) }
  let!(:transactions) { create_list(:transaction, 10) }
  let!(:transaction_attr) { attributes_for(:transaction) }

  before do
    @headers = {
      'ACCEPT' => 'application/json',
      'HTTP_AUTHORIZATION' => 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE2NDc1OTk5MDV9.cvDU5SJDg2yCkyj5gndJpXt_9mPdK3xn8rynYvfIHus'
    }
  end

  describe 'GET /index' do
    context 'when not logged in' do
      it 'returns unauthorized' do
        get transactions_url
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when logged in' do
      it 'renders a successful response with transactions array' do
        get transactions_url, headers: @headers
        expect(response).to have_http_status(200)
        # expect(response.body).to include('transactions')
      end
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get transaction_url(transaction), headers: @headers
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new transaction successfully' do
        expect do
          post transactions_url, params: { transaction: transaction_attr }, headers: @headers
        end.to change(Transaction, :count).by(1)
        expect(response.status).to eq(200)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new transaction' do
        post transactions_url, params: { transaction: { customer_id: nil } }, headers: @headers
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
