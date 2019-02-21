class Book < Product
  attr_reader :genre, :author

  def initialize(params)
    super

    @genre = params[:genre]
    @author = params[:author]
  end

  def self.from_file(file_path)
    file = File.readlines(file_path, chomp: true)

    self.new(
      name: file[0],
      genre: file[1],
      author: file[2],
      price: file[3].to_i,
      amount: file[4].to_i
    )
  end

  def update(params)
    super

    @genre = params[:genre] if params[:genre]
    @author = params[:author] if params[:author]
  end

  def to_s
    "Книга <<#{name}>>, #{genre}, автор - #{author}, #{super}"
  end
end
