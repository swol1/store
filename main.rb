require_relative "lib/product"
require_relative "lib/book"
require_relative "lib/film"
require_relative 'lib/disc'
require_relative "lib/product_collection"


collection = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')

collection.sort!(by: :price)

arr = []

price = 0

coll2 = []

collection.to_a.each { |product| coll2 << product }

loop do
  puts "Что Вы хотите купить?"
  puts
  coll2.each_with_index { |product, index| puts "#{index + 1}. #{product}" }
  puts "0. Выход"

  user_choice = STDIN.gets.chomp.to_i
  if user_choice == 0
    puts "Вы купили: "
    puts
    puts arr
    puts
    puts "С вас - #{price} руб. Спасибо за покупки"
    break
  end

  coll2[user_choice - 1].amount -= 1

  puts
  puts "Вы выбрали: #{coll2[user_choice - 1]}"

  arr << coll2[user_choice - 1]
  price += coll2[user_choice - 1].price

  puts
  puts "Всего товаров на сумму: " + price.to_s
  puts
end

