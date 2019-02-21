class Order
  attr_reader :user_order, :total_price

  def initialize
    @user_order = []
    @ordered_amount = []
    @total_price = 0
  end

  def order_processing(user_choice)
    user_choice.amount -= 1
    @user_order << user_choice

    sum_price(user_choice)
  end

  def sum_price(user_choice)
    @total_price += user_choice.price
  end
end