require 'curses'
require 'deathhack/version'
require 'deathhack/map'
require 'deathhack/rogue'
require 'deathhack/strings'

module DeathHack extend self
  extend Curses

  def begin_game
    noecho
    init_screen
    stdscr.keypad true
    curs_set 0
    setpos 0,0
    addstr Strings::OpeningMessage
    getch

    loop do
      @rogue = Rogue.new
      Map.init
      game_loop
    end
  end

  def draw_gravestone
    clear
    center = (cols - Strings::Gravestone.lines.first.chomp.size) / 2
    Strings::Gravestone.each_line.with_index do |line,index|
      setpos index,center
      addstr line.chomp
    end
    @rogue.died_to.each_line.with_index do |line,index|
      setpos Strings::Gravestone.lines.count+index,0
      addstr line.center cols
    end
    turns = "You took #{@turns} turns to die."
    setpos Strings::Gravestone.lines.count+3,0
    addstr turns.center cols
    exit if getch == 'n'
  end

  def game_loop
    @turns = 0
    begin 
      case getch
      when 'h', Curses::Key::LEFT
        @rogue.move :left
      when 'j', Curses::Key::DOWN
        @rogue.move :down
      when 'k', Curses::Key::UP
        @rogue.move :up
      when 'l', Curses::Key::RIGHT
        @rogue.move :right
      end
      @turns += 1

      if @rogue.dead?
        getch
        draw_gravestone
      end
    end while !@rogue.dead?
  end
end
