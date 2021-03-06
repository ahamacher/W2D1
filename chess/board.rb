# require_relative "piece.rb"
require "byebug"
require "colorize"
require_relative "piece.rb"

class Board
    attr_accessor :board
    def initialize
        nil_piece = NullPiece.instance
        @board = Array.new(8) { Array.new(8, nil_piece) }
        self.populate_board
    end

    def populate_board
        board.map.with_index do |row, idx|
            if idx == 0
                row.each_with_index do |tile, c_idx| 
                    if c_idx == 0 || c_idx == 7
                        row[c_idx] = Rook.new("♜".colorize(:black),self,[[idx,c_idx]])
                    elsif c_idx == 1 || c_idx == 6
                        row[c_idx] = Knight.new("♞".colorize(:black),self,[[idx,c_idx]])
                    elsif c_idx == 2 || c_idx == 5
                        row[c_idx] = Bishop.new("♝".colorize(:black),self,[[idx,c_idx]])
                    elsif c_idx == 3
                        row[c_idx] = Queen.new("♛".colorize(:black),self,[[idx,c_idx]])
                    else
                        row[c_idx] = King.new("♚".colorize(:black),self,[[idx,c_idx]])
                    end
                end
        
            elsif idx == 1
                row.each_with_index { |tile, c_idx| row[c_idx] = Piece.new("♟".colorize(:black),self,[[idx,c_idx]]) }
            elsif idx == 6
                row.each_with_index { |tile, c_idx| row[c_idx] = Piece.new("♙".colorize(:green),self,[[idx,c_idx]]) }
            elsif idx == 7
                row.each_with_index do |tile, c_idx|
                    if c_idx == 0 || c_idx == 7
                        row[c_idx] = Rook.new("♖".colorize(:green),self,[[idx,c_idx]])
                    elsif c_idx == 1 || c_idx == 6
                        row[c_idx] = Knight.new("♘".colorize(:green),self,[[idx,c_idx]])
                    elsif c_idx == 2 || c_idx == 5
                        row[c_idx] = Bishop.new("♙".colorize(:green),self,[[idx,c_idx]])
                    elsif c_idx == 3
                        row[c_idx] = Queen.new("♕".colorize(:green),self,[[idx,c_idx]])
                    else
                        row[c_idx] = King.new("♔".colorize(:green),self,[[idx,c_idx]])
                    end
                end
            end
        end
    end

    def valid_pos?(check_pos)
        return false if check_pos[0] < 0 || check_pos[0] > 7
        return false if check_pos[1] < 0 || check_pos[1] > 7
        return true
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
