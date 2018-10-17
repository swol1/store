class Book < Product
  attr_accessor :genre

  def initialize(params)
    super

    @genre = params[:genre]
  end

  def update(params)
    super

    @genre = params[:genre] if params[:genre]
  end

  def to_s
    "Книга <<#{name}>>, #{genre}, автор - #{author}, #{super}"
  end
end
