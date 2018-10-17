class Film < Product
  attr_accessor :year

  def initialize(params)
    super

    @year = params[:year]
  end

  def update(params)
    super

    @year = params[:year] if params[:year]
  end

  def to_s
    "Фильм <<#{name}>>, #{year}, реж. #{author}, #{super}"
  end
end
