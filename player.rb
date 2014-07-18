class Player
  include Drawable

  SIZE = 28
  SPEED = 6
  attr_reader :x, :y, :p

  def initialize(x=30, y=30, p=9000)
    @x = x
    @y = y
    @p = p
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
    handle_rock_collisions!(window)
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

  def handle_rock_collisions!(window)
    # window.rocks.each do |rock|
    #   if intersect(rock)

    #   end
    # end
    nil
  end

  # def intersect?(obj)
  #   x1 < obj.x2 &&
  #   x2 > obj.x1 &&
  #   y1 < obj.y2 &&
  #   y2 > obj.y1
  # end

  def dx
    SPEED
  end

  def dy
    SPEED
  end

  def color
    Gosu::Color::GREEN
  end
end
