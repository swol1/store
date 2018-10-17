require_relative "lib/product"
require_relative "lib/book"
require_relative "lib/film"

current_path = File.dirname(__FILE__)

film = Film.from_file("#{current_path}/data/films/01.txt")
book = Book.from_file("#{current_path}/data/books/01.txt")

puts film
puts book