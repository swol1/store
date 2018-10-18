class Order
  attr_reader :user_order, :total_price, :all_products

  def initialize(products)
    @user_order = []
    @total_price = 0
    @all_products = products
  end

  def item_choice(user_choice)
    @all_products[user_choice].amount -= 1
    @user_order << @all_products[user_choice]

    sum_price(user_choice)
  end

  def sum_price(user_choice)
    @total_price += @all_products[user_choice].price
    remove_sold_out
  end

  def remove_sold_out
    @all_products.delete_if { |product| product.amount <= 0 }
  end
end