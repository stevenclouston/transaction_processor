#!/usr/bin/env ruby
# Assume you have three distributed data sources. Your task is to
# collect all data from these sources and return an aggregated result.
require('byebug')

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
