module TransactionsHelper
  def authorize(transaction)
    unless (@current_user[:id] == transaction.customer_id) || user_admin?
      raise Exceptions::AuthorizationError,
            'creator_id and customer_id not matching'
    end
    true
  end

  def user_admin?
    @current_user[:role] == 'admin'
  end

  def get_transactions
    if user_admin?
      Transaction.all
    else
      Transaction.where(customer_id: @current_user[:id])
    end
  end
end
