require 'colorize'
require_relative "board.rb"
require_relative "cursor.rb"

class Display
    attr_reader :board
    attr_accessor :cursor

    def initialize()
        @board = Board.new 
        @cursor = Cursor.new([0,0],board)
    end

    def render
        board.board.each_with_index do |row,row_i|
            row_output = ""

            white = row_i.even?

            row.each_with_index do |col, col_i|
                if cursor.cursor_pos == [row_i, col_i]
                    row_output += "  ".colorize(:blue).colorize( :background => :red)
                    white = !white
                elsif white
                    row_output += "  ".colorize(:blue).colorize( :background => :white)
                    white = false
                else
                    row_output += "  ".colorize(:white).colorize( :background => :blue)
                    white = true
                end
            end
            puts row_output
        end
    end

    def show
        self.render
        while true
            cursor.get_input
            system("clear")
            self.render
        end
    end
end

if __FILE__ == $PROGRAM_NAME
    test = Display.new
    test.show
end