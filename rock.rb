class Rock
  include Drawable

  SIZE = 32

  attr_reader :x, :y, :p

  def initialize(x, y, p=0)
    @x = x
    @y = y
    @p = p
  end

  private

  def x1; @x - SIZE/2; end
  def x2; @x + SIZE/2; end
  def y1; @y - SIZE/2; end
  def y2; @y + SIZE/2; end

  def color
    Gosu::Color::BLUE
  end
end
