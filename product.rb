class Product
  attr_accessor :price, :amount, :name, :author

  def initialize(params)
    @price = params[:price]
    @amount = params[:amount]
    @name = params[:name]
    @author = params[:author]
  end

  def update(params)
    @price = params[:price] if params[:price]
    @amount = params[:amount] if params[:amount]
    @name = params[:name] if params[:name]
    @author = params[:author] if params[:author]
  end

  def to_s
    "#{price} руб. осталось (#{amount})"
  end
end
