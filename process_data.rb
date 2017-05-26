require_relative('coding_challenge')
require_relative('shops_database')
require_relative('transactions_database')
require_relative('slips_database')
require_relative('slip')

require('byebug')

class ProcessData
  @transactions
  @slips
  @online_store_database

  def initialize(params)
    @transactions = TransactionsDatabase.new(params[:transactions])
    @slips = SlipsDatabase.new(params[:slips])
    @online_store_database = ShopsDatabase.new(params[:store_database])

  end

  def process
    slip_ids = @slips.ids
    slip_ids.each do |slip_id|
      slip = @slips.slip(slip_id)
      number_transactions = slip.number_transactions
      byebug
      total_amount = slip.total_amount(@transactions)
      byebug
    end
  end

end

coding_challenge = CodingChallenge.new
process_data = ProcessData.new({slips: coding_challenge.slips, transactions: coding_challenge.transactions, store_database: coding_challenge.shops})
process_data.process
byebug


Transactions.new(transactions)
