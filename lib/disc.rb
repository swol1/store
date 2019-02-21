class Disc < Product
  attr_reader :year, :artist, :genre

  def initialize(params)
    super

    @year = params[:year]
    @artist = params[:artist]
    @genre = params[:genre]
  end

  def self.from_file(file_path)
    file = File.readlines(file_path, chomp: true)

    self.new(
      name: file[0],
      artist: file[1],
      genre: file[2],
      year: file[3],
      price: file[4].to_i,
      amount: file[5].to_i
    )
  end

  def update(params)
    super

    @year = params[:year] if params[:year]
    @artist = params[:artist] if params[:artist]
    @genre = params[:genre] if params[:genre]
  end

  def to_s
    "Альбом #{artist} - <<#{name}>>, #{genre}, #{year}, #{super}"
  end
end
