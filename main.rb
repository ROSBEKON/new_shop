if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'
require_relative 'lib/disk'
require_relative 'lib/product_collection'

collection = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')

collection.sort!(by: :price, order: :asc)

collection.print_products

input_user = nil
current_sum = 0
while input_user  != 0 do
  input_user = gets.to_i
  if input_user > 0
    current_sum += collection.product_selection((input_user) - 1)
    puts "Всего товаров на сумму: #{current_sum}"
    collection.print_products
  end
end

puts
puts "Вы купили: "
puts
puts collection.total_array
puts
puts "С Вас - #{current_sum}руб. Спасибо за покупки !"
