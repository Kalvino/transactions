require 'rails_helper'

RSpec.describe 'Transactions', type: :request do
  let!(:transaction) { create(:transaction) }
  let!(:transactions) { create_list(:transaction, 10) }
  let!(:transaction_attr) { attributes_for(:transaction) }

  describe 'GET /index' do
    context 'when not logged in' do
      it 'returns unauthorized' do
        get transactions_url
        expect(response).to have_http_status('unauthorized')
      end
    end

    context 'when logged in' do
      it 'renders a successful response with transactions array' do
        get transactions_url
        expect(response).to have_http_status(200)
        expect(response.body).to include('transactions')
      end
    end

    # it 'returns status of 200 if logged in' do
    #   transaction = create_transaction
    #   headers = get_headers(transaction.email)
    #   get transactions_url, headers: headers
    #   expect(response).to have_http_status(200)
    # end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get transaction_url(transaction)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new transaction and redirects to transactions index' do
        expect do
          post transactions_url, params: { transaction: transaction_attr }
        end.to change(transaction, :count).by(1)
        expect(response.status).to eq(302)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new transaction' do
        expect do
          post transactions_url, params: { transaction: { first_name: nil } }
        end.to change(transaction, :count).by(0)
      end
    end
  end
end
