require 'curses'
require 'deathhack/map'

class Rogue
  include Curses
  
  attr_accessor :position

  def initialize
    @position = [rand(0..80),rand(3..25)]
  end

  def dead?
    @dead
  end

  def died_to
    @killer
  end

  def die message
    @dead = true
    @killer = message.dup
  end

  def move direction
    new_position = @position.dup
    case direction
    when :left
      new_position[0] -= 1
    when :right
      new_position[0] += 1
    when :up
      new_position[1] -= 1
    when :down
      new_position[1] += 1
    end

    if new_position[0] < 0 || new_position[0] > cols-1 || new_position[1] < 3 || new_position[1] > lines-1
      return
    end

    creature = Map.creature_at? new_position

    if creature
      collide_with creature
    else
      redraw new_position
    end
  end

  def collide_with creature
    Map.clear_message
    setpos 0,0
    addstr creature.message
    die(creature.message) if creature.deadly?
  end

  def redraw new_position
    setpos *@position.reverse
    addstr '.'
    @position = new_position
    setpos *@position.reverse
    addstr '@'
  end
end
