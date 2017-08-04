if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative "lib/products"
require_relative "lib/films"
require_relative "lib/books"

products = []

products << Films.new(title: 'Леон', year: '1994', director: 'Люк Бессон', price: 990, amount: 5)
products << Films.new(title: 'Дурак', year: '2014', director: 'Юрий Быков', price: 390, amount: 1)
products << Books.new(title: 'Идиот', genre: 'роман', author: 'Федор Достоевский', price: 1500, amount: 10)


puts 'Вот какие товары у нас есть:'
puts
products.each { |product| puts product }