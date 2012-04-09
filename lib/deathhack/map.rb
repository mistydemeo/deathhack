require 'curses'
require 'deathhack/creature'
require 'deathhack/colours'

module DeathHack
  module Map extend self
    extend Curses

    def init
      clear_message
      draw_separator
      draw_empty_playfield

      @creatures = []
      generate_creatures(@creatures)
      draw_creatures
    end

    def clear_message
      (0..1).each do |y|
        (0..cols-1).each do |x|
          setpos(y,x)
          addstr(' ')
        end
      end
    end

    def draw_separator
      (0..cols).each do |y|
        setpos(2,y)
        addstr('#')
      end
    end

    def draw_empty_playfield
      (3..lines).each do |y|
        (0..cols).each do |x|
          setpos(y,x)
          addstr('.')
        end
      end
    end

    def generate_creatures destination, number=25
      (1..number).each do
        destination << Creature.new
      end
    end

    def draw_creatures
      @creatures.each do |creature|
        setpos *creature.position
        Colour.colour_print :string => creature.shape, :colour => creature.colour
      end
    end

    def creature_overlaps? creature
      @creatures.any? do |list_creature|
        [:position,:message,:shape].any? {|trait| list_creature.send(trait) == creature[trait]}
      end
    end

    def creature_at? position
      @creatures.each do |creature|
        return creature if creature.position.reverse == position
      end

      false # if no creature was found
    end
  end
end
