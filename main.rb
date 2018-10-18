require_relative "lib/product"
require_relative "lib/book"
require_relative "lib/film"
require_relative 'lib/disc'
require_relative "lib/product_collection"


collection = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')

collection.sort!(by: :price)

user_order = []

price = 0

products = []

collection.to_a.each { |product| products << product }

loop do
  puts "Что Вы хотите купить?"
  puts
  products.each_with_index { |product, index| puts "#{index + 1}. #{product}" }
  puts "0. Выход"

  user_choice = STDIN.gets.chomp.to_i

  if user_choice == 0
    puts "Вы купили: "
    puts
    puts user_order
    puts
    puts "С вас - #{price} руб. Спасибо за покупки"
    break
  end

  products[user_choice - 1].amount -= 1

  puts
  puts "Вы выбрали: #{products[user_choice - 1]}"

  user_order << products[user_choice - 1]
  price += products[user_choice - 1].price

  puts
  puts "Всего товаров на сумму: " + price.to_s
  puts
end

