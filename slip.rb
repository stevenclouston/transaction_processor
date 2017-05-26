class Slip

  attr_accessor :id, :transaction_ids, :shop_id

  def initialize(params)
    @id = params[0].split('_')[1].to_i
    @transaction_ids = params[1][:transactions]
    @shop_id = params[1][:shop]
  end

  def number_transactions
    @transaction_ids.count
  end

  def total_amount(transactions_database)
    total_amount = transactions_database.transaction(@transaction_ids.first).amount
    @transaction_ids.drop(1).each do |transaction_id|
      transaction = transactions_database.transaction(transaction_id)
      total_amount = total_amount - transaction.amount
    end
    return total_amount
  end
end
