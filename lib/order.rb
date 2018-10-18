class Order
  attr_reader :user_order, :cost

  def initialize(products)
    @all_products = products
    @user_order = []
    @cost = 0
  end

  def all
    @all_products.each_with_index { |product, index| "#{index + 1}. #{product}" }
  end

  def item_choice(user_choice)
    @all_products[user_choice].amount -= 1
    @user_order << @all_products[user_choice]
    @all_products[user_choice]
  end

  def sum_price(user_choice)
    @cost += @all_products[user_choice].price
  end
end