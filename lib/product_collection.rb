class ProductCollection

  attr_accessor :total_array

  PRODUCT_TYPES = {
    film: {dir: 'films', class: Film},
    book: {dir: 'books', class: Book},
    disk: {dir: 'disks', class: Disk}
  }

  def initialize(products = [])
    @products = products
    @total_array = []
  end

  def self.from_dir(dir_path)
    products = []

    PRODUCT_TYPES.each do |type, hash|
      product_dir = hash[:dir]
      product_class = hash[:class]

      Dir[dir_path + '/' + product_dir + '/*.txt'].each do |path|
        products << product_class.from_file(path)
      end
    end

    self.new(products)
  end

  def to_a
    @products
  end

  def sort!(params)

    case params[:by]
    when :title
      @products.sort_by! { |product| product.to_s }
    when :price
      @products.sort_by! { |product| product.price }
    when :amount
      @products.sort_by! { |product| product.amount }
    end

    @products.reverse! if params[:order] == :asc

    self
  end

  def input_total_array(product)
    @total_array << product
  end

  def product_selection(number_of_select)
    product = @products[number_of_select]
    input_total_array(product)
    current_amount = product.amount - 1
    product.update(amount: current_amount)
    puts "Вы выбрали: #{product}"
    product.price
  end

  def print_products
    puts
    puts "Что хотите купить :"
    puts
    count = 1
    @products.to_a.each do |product|
      puts "#{count}. #{product}"
      count += 1
    end
    puts "0. Выход"
  end

end
