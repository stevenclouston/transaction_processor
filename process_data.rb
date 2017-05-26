require_relative('coding_challenge')
require_relative('shops_database')
require_relative('transactions_database')
require_relative('slips_database')
require_relative('slip')

class ProcessData

  @transactions
  @slips
  @shops_database

  def initialize(params)
    @transactions_database = TransactionsDatabase.new(params[:transactions])
    @slips_database = SlipsDatabase.new(params[:slips])
    @shops_database = ShopsDatabase.new(params[:store_database])
  end

  def process
    results = {}
    @slips_database.ids.each do |slip_id|
      slip = @slips_database.slip(slip_id)
      number_transactions = slip.number_transactions
      total_amount = slip.total_amount(@transactions_database)
      shop = @shops_database.all[slip.shop_id].shop_name
      result = { number_transactions: number_transactions, total_amount: total_amount,shop: shop}
      results[slip_id] = result
    end
    return results
  end
end

coding_challenge = CodingChallenge.new
process_data = ProcessData.new({slips: coding_challenge.slips, transactions: coding_challenge.transactions, store_database: coding_challenge.shops})
results = process_data.process
puts results
