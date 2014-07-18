class Cell
  include Drawable

  SIZE = 32

  attr_accessor :p

  def initialize(x_index, y_index, p)
    @x_index = x_index
    @y_index = y_index
    @p = p
  end

  def update(obj)
    @p = obj.p
  end

  def x1; x - SIZE/2; end
  def x2; x + SIZE/2; end
  def y1; y - SIZE/2; end
  def y2; y + SIZE/2; end

  def color
    p = p_to_color_range(@p)
    Gosu::Color.new(255, p, p, p)
  end

  def x
    @x_index * SIZE + (SIZE/2)
  end

  def y
    @y_index * SIZE + (SIZE/2)
  end

  private

  def p_to_color_range(p)
    (((p - 1) * (255 - 0)) / (1000 - 1)) + 0
  end
end
