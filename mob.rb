class Mob
  include Drawable

  SIZE = 32
  SPEED = 3

  def initialize(x, y)
    @x = x + SIZE/2
    @y = y + SIZE/2
  end

  def x1; @x - SIZE/2; end
  def x2; @x + SIZE/2; end
  def y1; @y - SIZE/2; end
  def y2; @y + SIZE/2; end

  def color
    Gosu::Color::RED
  end

  def update(cells)
    cell = find_cell_at_position(cells).neighbors(cells).max { |a, b|
      a.p <=> b.p
    }
    move_towards_cell(cell)
  end

  private

  def find_cell_at_position(cells)
    column = @x / Grid::SIZE
    row = @y / Grid::SIZE
    cells[row][column]
  end

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

  def dx; SPEED; end
  def dy; SPEED; end
end
