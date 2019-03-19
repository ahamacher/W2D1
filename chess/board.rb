require_relative "piece.rb"
require "byebug"

class Board
    attr_accessor :board
    def initialize
        @board = Array.new(8) { Array.new(8, nil) }
        self.populate_board
    end

    def populate_board
        board.map.with_index do |row, idx|
            if idx == 0 || idx == 7
                row.each_with_index { |tile, c_idx| row[c_idx] = Piece.new }
            elsif idx == 1 || idx == 6
                row.each_with_index { |tile, c_idx| row[c_idx] = Piece.new }
            end
        end
    end

    def move_piece(start_pos,end_pos)
        # expecting positions to come in array ex. [0,0] 
        if self[start_pos] && self[end_pos].nil?
            self[end_pos],self[start_pos] = self[start_pos],self[end_pos]
        elsif self[start_pos].nil?
            raise puts "Non existing piece, try again?"
        else 
            raise puts "Location already contains piece, try again?"
        end
        puts "move completed"
    end

    def [](pos)
        r_idx, c_idx = pos
        board[r_idx][c_idx]
    end

    def []=(pos, value)
        r_idx, c_idx = pos
        board[r_idx][c_idx] = value
    end

end