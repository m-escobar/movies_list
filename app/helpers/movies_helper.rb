module MoviesHelper
  def round_hundreds(count)
    count < 100 ? count : (count/100.0).ceil * 100
  end
end
