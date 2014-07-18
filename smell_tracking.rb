require 'gosu'

require './drawable'

require './player'
require './mob'
require './rock'
require './floor'
require './cell'

class SmellTracking < Gosu::Window
  def self.play!
    self.new.setup.show
  end

  def initialize(width=768, height=576, fullscreen=false)
    super
  end

  def setup
    @floor = Floor.new(self.width, self.height)
    @rocks = build_rocks(@floor)
    @player = Player.new
    @mobs  = [Mob.new(700, 500), Mob.new(500, 500), Mob.new(200, 300)]

    self
  end

  def draw
    @floor.draw(self)
    @rocks.each { |rock| rock.draw(self) }
    @player.draw(self)
    @mobs.each { |mob| mob.draw(self) }
  end

  def update
    @floor.update(@player, @mobs, @rocks)
    @player.update(self)
    @mobs.each { |mob| mob.update(@floor) }
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end

  private

  def build_rocks(floor)
    floor.cells.flatten.sample(20).map { |cell| Rock.new(cell.x, cell.y) }
  end
end

SmellTracking.play!
