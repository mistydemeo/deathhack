require 'curses'

module Colour extend self
  extend Curses
  @ansi = {:black   => Curses::COLOR_BLACK,
           :red     => Curses::COLOR_RED,
           :green   => Curses::COLOR_GREEN,
           :yellow  => Curses::COLOR_YELLOW,
           :blue    => Curses::COLOR_BLUE,
           :magenta => Curses::COLOR_MAGENTA,
           :cyan    => Curses::COLOR_CYAN,
           :white   => Curses::COLOR_WHITE}

  def colours
    @ansi.keys
  end

  def colour_print opts
    attron  @ansi[opts[:colour]]
    attron  A_BOLD if opts[:bold]
    addstr  opts[:string]
    attroff @ansi[opts[:colour]]
  end
end
