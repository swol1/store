require_relative "lib/product"
require_relative "lib/book"
require_relative "lib/film"
require_relative 'lib/disc'
require_relative "lib/product_collection"
require_relative "lib/order"

collection = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')
collection.sort!(by: :price)

order = Order.new

loop do
  puts "Что Вы хотите купить?"
  puts
  collection.to_a.each_with_index do |product, index|
    puts "#{index + 1}. #{product}"
  end
  puts "0. Выход"

  user_choice = STDIN.gets.to_i

  user_product = collection.to_a[user_choice - 1]

  if user_choice == 0 && order.user_order.empty?
    abort "Вы ничего не выбрали для заказа. До свидания!"
  elsif user_choice == 0
    puts "Вы купили: "
    puts
    puts order.user_order
    puts
    puts "С вас - #{order.total_price} руб. Спасибо за покупки!"
    break
  end

  order.order_processing(user_product)

  puts
  puts "Вы выбрали: #{user_product}"
  puts
  puts "Всего товаров на сумму: #{order.total_price}"
  puts

  collection.to_a.reject! { |product| product.amount <= 0 }
end

