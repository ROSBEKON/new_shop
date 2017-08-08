class Disk < Product
  attr_accessor :title, :contractor, :genre, :year

  def self.from_file(file_path)
    lines = File.readlines(file_path, encoding: 'UTF-8').map { |l| l.chomp }

    self.new(
      title: lines[0],
      contractor: lines[1],
      genre: lines[2],
      year: lines[3].to_i,
      price: lines[4].to_i,
      amount: lines[5].to_i
    )
  end

  def initialize(params)
    super

    @title = params[:title]
    @contractor = params[:contractor]
    @genre = params[:genre]
    @year = params[:year]
  end

  def to_s
    "Диск #{@title}, #{@year}, #{@genre}, исполнитель - #{contractor},  #{super}"
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @contractor = params[:contractor] if params[:contractor]
    @genre = params[:genre] if params[:genre]
    @year = params[:year] if params[:year]
  end
end