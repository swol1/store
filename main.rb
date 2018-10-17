require_relative "product"
require_relative "book"
require_relative "film"

products = []

products << Film.new(price: 490, amount: 15, name: "Леон", year: 1994, author: "Люк Бессон")
products << Film.new(price: 720, amount: 7, name: "Дурак", year: 2014, author: "Юрий Быков")

products << Book.new(price: 1024, amount: 25, name: "Идиот", genre: "роман", author: "Федор Достоевский")
products << Book.new(price: 189, amount: 4, name: "Цветы для Элджернона", genre: "научная фантастика", author: "Даниел Киз")

products.each { |product| puts product }
