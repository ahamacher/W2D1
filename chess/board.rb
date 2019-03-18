require_relative "piece.rb"
require "byebug"
class Board
    attr_accessor :board
    def initialize
        @board = Array.new(8) { Array.new(8, nil) }
        populate_board
    end

    def populate_board
        @board.each_with_index do |row, i_row|
            if i_row == 0 || i_row == 7
                skill_row = [Piece.new, Piece.new, Piece.new, Piece.new, Piece.new, Piece.new, Piece.new, Piece.new]
                @board[i_row] = skill_row
            elsif i_row == 1 || i_row == 6 # add row of pawns
                skill_row = [Piece.new, Piece.new, Piece.new, Piece.new, Piece.new, Piece.new, Piece.new, Piece.new]
                @board[i_row] = skill_row
            end
        end
    end

    def move_piece(start_pos,end_pos)
        # expecting positions to come in array ex. [0,0]
        s_row, s_col  = start_pos 
        e_row,e_col = end_pos 
        if @board[s_row][s_col] && @board[e_row][e_col].nil?
            @board[e_row][e_col],@board[s_row][s_col] = @board[s_row][s_col],@board[e_row][e_col]
        elsif @board[s_row][s_col].nil?
            raise puts "Non existing piece, try again?"
        else 
            raise puts "Location already contains piece, try again?"
        end
        puts "move completed"
    end


end