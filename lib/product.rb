class Product
  attr_accessor :amount
  attr_reader :price, :name

  def initialize(params)
    @price = params[:price]
    @amount = params[:amount]
    @name = params[:name]
  end

  def update(params)
    @price = params[:price] if params[:price]
    @amount = params[:amount] if params[:amount]
    @name = params[:name] if params[:name]
  end

  def to_s
    "#{price} руб. осталось (#{amount})"
  end

  def self.from_file(file_path)
    raise NotImplemntedError
  end
end
