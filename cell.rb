class Cell
  include Drawable

  SIZE = 32

  attr_accessor :x, :y, :p

  def initialize(x, y, p=1)
    @x = x
    @y = y
    @p = p
  end

  def update(obj)
    @p = obj.p
  end

  private

  def p_to_color_range(p)
    (((p - 1) * (255 - 0)) / (1000 - 1)) + 0
  end

  def x1; x - SIZE/2; end
  def x2; x + SIZE/2; end
  def y1; y - SIZE/2; end
  def y2; y + SIZE/2; end

  def color
    p = p_to_color_range(@p)
    Gosu::Color.new(255, p, p, p)
  end
end
