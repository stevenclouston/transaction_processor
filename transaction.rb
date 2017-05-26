class Transaction
  attr_accessor :id, :amount, :payout
  def initialize(params)
    @id = params[:id]
    @amount = params[:amount]
    @payout = params[:payout]
  end
end
