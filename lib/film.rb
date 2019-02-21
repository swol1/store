class Film < Product
  attr_reader :year, :director

  def initialize(params)
    super

    @year = params[:year]
    @director = params[:director]
  end

  def self.from_file(file_path)
    file = File.readlines(file_path, chomp: true)

    self.new(
      name: file[0],
      director: file[1],
      year: file[2],
      price: file[3].to_i,
      amount: file[4].to_i
    )
  end

  def update(params)
    super

    @year = params[:year] if params[:year]
    @director = params[:director] if params[:director]
  end

  def to_s
    "Фильм <<#{name}>>, #{year}, реж. #{director}, #{super}"
  end
end
