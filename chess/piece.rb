#modules
require_relative "board.rb"

module Slideable
    # move_directions = { :queen => "both", :rook => "straight", :bishop => "diagonal" }
    #return [dx, dy] of positionals
    HORIZONTAL = [[0,1],[0,-1],[1,0],[-1,0]]
    DIAGONAL = [[1,1],[-1,1],[-1,-1],[1,-1]]

    def move_dirs
        raise "move directions not set for piece"
    end

    def moves
        all_steps = move_dirs
        p all_steps
    end

    def grow_unblocked_moves(dir)
        new_pos = self.pos 
        
        dir
        possible_positions = []
        until board[new_pos] != nil || !board.valid_pos?(new_pos)
            new_pos = [new_pos[0]+dir[0],new_pos[1]+dir[1]]
            
            possible_positions << new_pos
        end
        possible_positions
    end
end

module Stepable
    #king #knight
end

#classes 
class Piece
    # add current position
    # add color 
    attr_reader :pos, :board 
    def initialize(*color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s
        @color
    end

    def empty?

    end
    
    def valid_moves
        potential_moves = moves 
        potential_moves.include?(user_input)
    end
    
    def pos=(val)
        @pos = val
    end

    def symbol

    end

    private
    def move_into_check?(end_pos)

    end

    #to_s function to print
end

# class NullPiece < Piece
#     include Singleton
#     attr_reader 
#     def initialize
#         @color = " "
#     end

# end

class Queen < Piece
    include Slideable
    
    def move_dirs 
        possible_steps = HORIZONTAL + DIAGONAL 
        p possible_steps
        all_possible_positions = []
        possible_steps.each do | direction |
            all_possible_positions += grow_unblocked_moves(direction)
        end
        all_possible_positions
    end

end