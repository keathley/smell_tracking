class Grid
  include Drawable

  SIZE = 32

  attr_reader :p

  def initialize(x_index, y_index)
    @x_index = x_index
    @y_index = y_index
    @color = Gosu::Color::WHITE
    @p = 1
  end

  def update(player, cells)
    if contains_player?(player)
      @p = player.p
    else
      @p = neighbors(cells).inject(0) { |total, cell| total + cell.p }
      @p *= 0.25
    end
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

  def neighbors(cells)
    [
      up(cells),
      left(cells),
      down(cells),
      right(cells)
    ].compact
  end

  private

  def p_to_color_range(p)
    (((p - 1) * (255 - 0)) / (1000 - 1)) + 0
  end

  def contains_player?(player)
    x1 < player.x2 &&
    x2 > player.x1 &&
    y1 < player.y2 &&
    y2 > player.y1
  end

  def up(cells)
    return nil if @y_index.zero?
    cells[@y_index-1][@x_index]
  end

  def left(cells)
    return nil if @x_index.zero?
    cells[@y_index][@x_index-1]
  end

  def down(cells)
    return nil if @y_index == cells.length - 1
    cells[@y_index+1][@x_index]
  end

  def right(cells)
    return nil if @x_index == cells[@y_index].length
    cells[@y_index][@x_index+1] || nil
  end
end
