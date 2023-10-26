# require './player.rb'

class Board
    @@BOARD_SIZE = 3

    attr_reader :board

    def initialize(game)
        @board = []
        @game = game

        # Create board array
        @@BOARD_SIZE.times do 
            @board.push(Array.new(@@BOARD_SIZE, @@BOARD_SIZE))
        end
    end

    def check_move(coordinate)
        error = false
        error_message = ""
        if ((coordinate.length == 2) and (coordinate[0, 1].between?('A', ('A'.ord + @@BOARD_SIZE - 1).chr)) and (coordinate[1, 1].between?('1', @@BOARD_SIZE.to_s))) 
            # Get index
            row = coordinate[0, 1].ord - 'A'.ord
            col = coordinate[1, 1].to_i - 1
            # Check if coordinate is empty
            if board[row][col] != " "
                error = true
                error_message = "#{coordinate} is already used."
            end
        else
            error = true
            error_message = "#{coordinate} is not a valid coordinate value."
        end
        return error, error_message
    end

    def make_move(player, coordinate)
        error, error_message = check_move(coordinate)
        if error == false
            # Coordinate is correct => extract row and col
            row = coordinate[0, 1].ord - 'A'.ord
            col = coordinate[1, 1].to_i - 1
            puts("#{row}-#{col}")
            # Register move 
            @board[row][col] = player
        end
        return error, error_message
    end

    def check_winner(movements)
        @@WINNER_SEQS.each_with_index do |combination, combination_index|
            result = combination - movements
            if result.length() == 0
                return true
            end
        end
        return false
    end

    def clear_board()
        # Clean board
        for row in 0..(@@BOARD_SIZE-1)
            for col in 0..(@@BOARD_SIZE-1)
                @board[row][col] = " "
            end
        end
    end

    def print_board()
        write_row_header()
        write_divider()
        for row in 'A'..('A'.ord + @@BOARD_SIZE - 1).chr
            write_row(row, board[row.ord - 'A'.ord])
            write_divider()
        end

    end

    def is_full?()
        # Check if all cells are used
        @board.each_with_index do |row, row_index|
            if row.any? {|cell| cell == " "}
                return false
            end
        end
        return true
    end

    private
    @@WINNER_SEQS = [
        ['A1','B1','C1'],
        ['A2','B2','C2'],
        ['A3','B3','C3'],
        ['A1','A2','A3'],
        ['B1','B2','B3'],
        ['C1','C2','C3'],            
        ['A1','B2','C3'],
        ['A3','B2','C1'],
    ]

    def write_row_header()
        for col in '1'..@@BOARD_SIZE.to_s
            print("   ", col)
        end
        puts("  ")
    end
      
    def write_divider
        print(" ")
        for col in '1'..@@BOARD_SIZE.to_s
            print("+---")
        end
        puts("+")
    end

    def write_row(row_number, row)
        print "#{row_number}" 
        for col in '1'..@@BOARD_SIZE.to_s
            print("| #{row[col.to_i - 1]} ")
        end
        puts("|")
    end
end