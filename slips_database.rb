require_relative("slip")

class SlipsDatabase
  
  attr_accessor :all

  def initialize(params)
    @all = {}
    params.each do |slip|
      @all[Slip.new(slip).id] = Slip.new(slip)
    end
  end

  def ids
    @all.map{|s| s[0]}
  end

  def slip(slip_id)
    @all[slip_id]
  end
end
