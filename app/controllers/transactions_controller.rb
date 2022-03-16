class TransactionsController < ApplicationController
  include TransactionsHelper
  def index
    @transactions = get_transactions
  end

  def show
    @transaction = Transaction.find(params[:id])
    authorize(@transaction)
  end

  def create
    @transaction = Transaction.new(transaction_params)
    authorize(@transaction)
    @transaction.save!
  end

  private

  def transaction_params
    params.require(:transaction).permit(:customer_id, :input_amount, :input_currency, :output_amount, :output_currency)
  end
end
