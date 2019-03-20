#modules
require 'byebug'
require "singleton"


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
        possible_positions = []
        # debugger
        until board[new_pos] != nil || !board.valid_pos?(new_pos)
            new_pos = [ new_pos[0] + dir[0], new_pos[1] + dir[1] ]
            
            possible_positions << new_pos
        end
        possible_positions
    end
end

module Stepable
    #king #knight
    def moves
        all_steps = move_dirs
        p all_steps
    end
end

#classes 
class Piece
    # add current position
    # add color 
    attr_reader :pos, :board 
    def initialize(color, board, pos)
        @color = color 
        @board = board
        @pos = pos
    end

    def to_s
       " "+ @color+ " "
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

class NullPiece < Piece
    include Singleton
    attr_reader :color
    def initialize
        @color = " "
    end

end

class Queen < Piece
    include Slideable
    
    def move_dirs 
        possible_steps = HORIZONTAL + DIAGONAL 
        all_possible_positions = []
        possible_steps.each do | direction |
            all_possible_positions += grow_unblocked_moves(direction)
        end
        all_possible_positions
    end

end

class Bishop < Piece
    include Slideable

    def move_dirs 
        possible_steps = DIAGONAL 
        all_possible_positions = []
        possible_steps.each do | direction |
            all_possible_positions += grow_unblocked_moves(direction)
        end
        all_possible_positions
    end
end

class Rook < Piece
    include Slideable

    def move_dirs 
        possible_steps = HORIZONTAL 
        all_possible_positions = []
        possible_steps.each do | direction |
            all_possible_positions += grow_unblocked_moves(direction)
        end
        all_possible_positions
    end
end

class Knight < Piece 
    include Stepable

    def move_dirs
        steps = [[2,1],[2,-1],[-2,1],[-2,-1],[1,2],[1,-2],[-1,2],[-1,-2]]
        possible_moves = [] 
        steps.each do |direction|
            possible_moves << [self.pos[0]+direction[0],self.pos[1]+direction[1]]
        end
        possible_moves
    end
end

class King < Piece 
    include Stepable

    def move_dirs 
        steps = [[1,0],[0,1],[-1,0],[0,-1],[-1,-1],[-1,1],[1,-1],[1,1]]
        possible_moves = []
        steps.each do |direction|
            possible_moves << [self.pos[0]+direction[0],self.pos[1]+direction[1]]
        end
        possible_moves
    end
end

class Pawn < Piece

    def initialize
        super(color, board, pos)
        @first_move = true
    end

    def forward_dir
        starting_pos = pos
        if starting_pos.first == 1
            @dir = 1
        else
            @dir = -1
        end
    end

    def forward_steps
        initial_pos = pos
        potential_moves = []
        if @first_move == true
            forward_dir
            (1..2).each do |step|
                initial_pos[0] += 1 * @dir
                potential_moves << initial_pos
            end
            @first_move = false
        else
            initial_pos[0] += 1 * @dir
            potential_moves << initial_pos
        end
        possible_moves
    end

end

