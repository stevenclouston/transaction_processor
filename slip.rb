class Slip
  attr_accessor :id, :transactions, :shop_id
  def initialize(params)
    @id = params[0].split('_')[1].to_i
    @transactions = params[1][:transactions]
    @shop_id = params[1][:shop]
  end

  def number_transactions
    @transactions.count
  end

  def total_amount(transactions_database)
    byebug
  end
end
