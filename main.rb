require_relative "lib/product"
require_relative "lib/book"
require_relative "lib/film"
require_relative 'lib/disc'
require_relative "lib/product_collection"
require_relative "lib/order"

collection = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')

collection.sort!(by: :price)

order = Order.new(collection.to_a)

loop do
  puts "Что Вы хотите купить?"
  puts
  puts order.all
  puts "0. Выход"

  user_choice = STDIN.gets.chomp.to_i - 1

  if user_choice == -1
    puts "Вы купили: "
    puts
    puts order.user_order
    puts
    puts "С вас - #{order.cost} руб. Спасибо за покупки"
    break
  end

  puts
  puts "Вы выбрали: #{order.item_choice(user_choice)}"
  puts
  puts "Всего товаров на сумму: #{order.sum_price(user_choice)}"
  puts
end

