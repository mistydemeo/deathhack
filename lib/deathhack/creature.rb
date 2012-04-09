require 'deathhack/map'
require 'deathhack/colours'
require 'deathhack/messages'

module DeathHack
  class Creature
    include Curses
    attr_reader :position, :message, :shape, :colour

    def initialize
      begin
        @position = [rand(3..lines),rand(0..cols)]

        @shape = rand(33..126).chr
        @message, @deadly = Messages.sample
      end while Map.creature_overlaps? :position=>@position,:shape=>@shape,:message=>@message

      @colour = Colour.colours.sample
    end

    def deadly?
      @deadly
    end
  end
end
