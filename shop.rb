class Shop

  attr_accessor :id, :shop_name

  def initialize(params)
    @id = params[0]
    @shop_name = params[1]
  end
end
