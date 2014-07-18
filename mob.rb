class Mob
  include Drawable

  SIZE = 32
  SPEED = 3

  attr_reader :x, :y, :p

  def initialize(x, y, p=-10)
    @x = x + SIZE/2
    @y = y + SIZE/2
    @p = p
  end

  def update(floor)
    cell = floor.largest_positive_surrounding_cell(@x, @y)
    move_towards_cell(cell) if cell
  end

  private

  def move_towards_cell(cell)
    up!     if cell.y < @y
    down!   if cell.y > @y
    left!   if cell.x < @x
    right!  if cell.x > @x
  end

  def up!
    @y -= dy
  end

  def down!
    @y += dy
  end

  def left!
    @x -= dx
  end

  def right!
    @x += dx
  end

  def dx
    SPEED
  end

  def dy
    SPEED
  end

  def x1; @x - SIZE/2; end
  def x2; @x + SIZE/2; end
  def y1; @y - SIZE/2; end
  def y2; @y + SIZE/2; end

  def color
    Gosu::Color::RED
  end
end
