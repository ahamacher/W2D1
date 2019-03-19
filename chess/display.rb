require "colorize"
require_relative "board.rb"
require_relative "cursor.rb"

class Display
    attr_reader :board

    def initialize()
        @board = Board.new 
        @cursor = Cursor.new([0,0],board)
    end

end