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
  order.all_products.each_with_index { |product, index| puts "#{index + 1}. #{product}" }
  puts "0. Выход"

  user_choice = STDIN.gets.chomp.to_i - 1

  if user_choice == -1 && order.user_order.empty?
    abort "Вы ничего не выбрали для заказа. До свидания!"
  elsif user_choice == -1
    puts "Вы купили: "
    puts
    puts order.user_order
    puts
    puts "С вас - #{order.total_price} руб. Спасибо за покупки!"
    break
  end

  order.item_choice(user_choice)

  puts
  puts "Вы выбрали: #{order.user_order.last}"
  puts
  puts "Всего товаров на сумму: #{order.total_price}"
  puts
end

