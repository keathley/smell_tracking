class Floor
  attr_reader :cells

  def initialize(width, height, cells=nil)
    @cells = cells || build_cells(width, height)
  end

  def draw(window)
    @cells.flatten.each { |cell| cell.draw(window) }
  end

  def update(player, mobs, rocks)
    diffuse_cells!
    update_cells(player)
    mobs.each { |mob| update_cells(mob) }
    rocks.each { |rock| update_cells(rock) }
  end

  def largest_positive_surrounding_cell(x, y)
    cells = neighbor_cells(pos_index(x), pos_index(y))
    cells.select! { |cell| cell.p > 0 }
    cells.max { |a, b| a.p <=> b.p }
  end

  private

  def build_cells(width, height)
    columns = width / Cell::SIZE
    rows = height / Cell::SIZE
    cells = Array.new(rows) { |y| Array.new(columns) { |x| Cell.new(x, y, 1) } }
  end

  def update_cells(obj)
    cell_at_position(obj.x, obj.y).update(obj)
  end

  def diffuse_cells!
    @cells.each_with_index do |y, yi|
      y.each_with_index do |cell, xi|
        cell.p = new_p(xi, yi)
      end
    end
  end

  def new_p(x, y)
    neighbor_cells(x, y).inject(0) { |sum, c| sum + c.p } * 0.25
  end

  def neighbor_cells(x, y)
    [
      cell_above(x, y),
      cell_right(x, y),
      cell_below(x, y),
      cell_left(x, y)
    ].compact
  end

  def cell_above(x, y)
    @cells[y-1][x] unless y == 0
  end

  def cell_below(x, y)
    @cells[y+1][x] unless y == @cells.length - 1
  end

  def cell_left(x, y)
    @cells[y][x-1] unless x == 0
  end

  def cell_right(x, y)
    @cells[y][x+1] unless x == @cells[y].length - 1
  end

  def cell_at_position(x, y)
    @cells[pos_index(y)][pos_index(x)]
  end

  def pos_index(pos)
    pos/Cell::SIZE
  end
end
