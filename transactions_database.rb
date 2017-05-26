require_relative("transaction")
class TransactionsDatabase
  attr_accessor :all
  def initialize(params)

    @all = {}
    params.each do |transaction|
      @all[Transaction.new(transaction).id] = Transaction.new(transaction)
    end
  end

  def number_transactions
    @all.count
  end

  def transaction(id)
    @all[:id]
  end



end
