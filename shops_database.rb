require_relative("shop")
class ShopsDatabase
  attr_accessor :all
  def initialize(params)
    @all = {}
    params.each do |shop|
        @all[Shop.new(shop).id] = Shop.new(shop)
    end

  end
end
