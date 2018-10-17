require_relative "lib/product"
require_relative "lib/book"
require_relative "lib/film"
require_relative 'lib/disc'
require_relative "lib/product_collection"


collection = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')

collection.sort!(by: :price)

puts "Что Вы хотите купить?"
puts
collection.to_a.each_with_index { |product, index| puts "#{index + 1}. #{product}" }
puts "0. Выход"