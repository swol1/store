require_relative "lib/product"
require_relative "lib/book"
require_relative "lib/film"
require_relative "lib/product_collection"

collection = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')

collection.sort!(by: :price)

collection.to_a.each { |product| puts product }

# film = Film.from_file("#{current_path}/data/films/01.txt")
# book = Book.from_file("#{current_path}/data/books/01.txt")
#
# puts film
# puts book