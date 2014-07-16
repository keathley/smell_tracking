class Player
  include Drawable

  SIZE = 28
  SPEED = 6
  attr_reader :x, :y, :p

  def initialize
    @x = 30
    @y = 30
    @p = 1000
  end

  def x1; @x - SIZE/2; end
  def x2; @x + SIZE/2; end
  def y1; @y - SIZE/2; end
  def y2; @y + SIZE/2; end

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

  def update(window)
    handle_input!(window)
    handle_wall_collisions!(window)
  end

  private

  def handle_input!(window)
    up!    if window.button_down?(Gosu::KbW)
    down!  if window.button_down?(Gosu::KbS)
    left!  if window.button_down?(Gosu::KbA)
    right! if window.button_down?(Gosu::KbD)
  end

  def handle_wall_collisions!(window)
    @y = SIZE/2 if y1 < 0
    @y = window.height-SIZE/2 if y2 > window.height
    @x = SIZE/2 if x1 < 0
    @x = window.width-SIZE/2 if x2 > window.width
  end

  def dx; SPEED; end
  def dy; SPEED; end

  def color
    Gosu::Color::GREEN
  end
end