class Shop
  attr_accessor :id, :company_name

  def initialize(params)
    @id = params[0]
    @company_name = params[1]
  end
end
