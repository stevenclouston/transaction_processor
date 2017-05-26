
**Synopsis**

This is a program that collects three distributed data sources and returns an aggregated result.

**Code Example**

```ruby
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
```

**Installation**

Git clone https://github.com/stevenclouston/transaction_processor.git

run: ruby process_data.rb in Terminal

**Tests**

No tests have been written yet.

**Contributors**

Steven Clouston

**More info about this project**

This solution is based on the test below:

O#!/usr/bin/env ruby

Assume you have three distributed data sources. Your task is to
collect all data from these sources and return an aggregated result.

class CodingChallenge

  attr_accessor :slips, :transactions, :shops, :result

  def initialize
    @slips = {

      "slip_23" => {
        transactions: [123, 456],
        shop: 1
      },
      "slip_42" => {
        transactions: [789],
        shop: 2
      }
    }

    @transactions = [
      {
        id: 123,
        amount: 10.01,
        payout: false
      },
      {
        id: 456,
        amount: 5.01,
        payout: true
      },
      {
        id: 789,
        amount: 20.1,
        payout: false
      }
    ]

    @shops = [
      [1, 'Zalando.de'],
      [2, 'Amazon.com']
    ]
    # Task: Use the three data sources above and create the following result:
    result = {
      23 => {
        number_transactions: 2, # Number of transactions per slip
        total_amount: 5.0,      # Total amount of transactions (a payout must
                                # be subtracted instead of added!)
        shop: 'Zalando.de'      # Shop title
      },
      42 => {
        number_transactions: 1,
        total_amount: 20.1,
        shop: 'Amazon.com'
      }
    }
  end
end
