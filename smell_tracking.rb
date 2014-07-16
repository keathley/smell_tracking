require 'gosu'

require './drawable'

require './player'
require './grid'
require './mob'

class SmellTracking < Gosu::Window
  def self.play!
    self.new.setup.show
  end

  def initialize(width=768, height=576, fullscreen=false)
    super
  end

  def setup
    @player = Player.new
    @cells = build_cells
    @mob = Mob.new(700, 500)

    self
  end

  def draw
    @cells.flatten.each { |cell| cell.draw(self) }
    @player.draw(self)
    @mob.draw(self)
  end

  def update
    diffuse_cells(@cells)
    @player.update(self)
    @mob.update(@cells)
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end

  def build_cells
    columns = width / Grid::SIZE
    rows = height / Grid::SIZE

    Array.new(rows) { |y| Array.new(columns) { |x| Grid.new(x, y) } }
  end

  def diffuse_cells(cells)
    cells.flatten.each { |cell| cell.update(@player, @cells) }
  end
end

SmellTracking.play!
