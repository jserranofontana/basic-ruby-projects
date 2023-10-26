require './player.rb'
require './board.rb'

class Game
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
    @@PLAYER_NAMES = ['X', 'O']

    attr_reader :board, :turn

    def initialize()
        @board = Board.new(self)
        @turn = ''
        @players = {}
        @@PLAYER_NAMES.each do |name|
            @players[name] = Player.new(self, name)
        end
    end

    def play_game()
        exited = false
        until exited do
            # Start a new Game
            new_game()

            # Get first player
            @turn = get_initial_player()

            # Game Loop
            winner = false
            board_full = false
            until exited or winner or board_full do
                puts `clear`
                puts("Wellcome to our game - TIC-TAC-TOE")
                @board.print_board()

                coordinate, exited = get_next_move(@turn)

                if not exited and coordinate != ''
                    error, error_message = @players[@turn].make_move(coordinate)       
                    
                    if error
                        puts("#{error_message}.")
                        puts("Try it again please")
                        sleep(3)
                    else
                        puts `clear`
                        puts("Wellcome to our game - TIC-TAC-TOE")
                        @board.print_board()

                        # Check for winners
                        winner = @players[@turn].wins?
                        if (!winner)
                            if (@board.is_full?)
    #                            print_board()
                                puts("Board is full. Nobody wins")
                                board_full = true
                            else
                                # New turn
                                self.new_turn()
                            end
                        else
                            puts("Player #{@turn} WINS !!!!. Hurray!!!!")
                        end 
                    end
                end
            end
            if not exited
                puts("Play again? (Y/N)")
                exited = gets.chomp.upcase == "N"
            end
        end
    end

    def new_turn()
        if @turn == "X"
            @turn = "O"
        else
            @turn = "X"
        end
    end

    def get_next_move(turn)
        puts("Player #{turn}, make your next move")
        exited = false
        coordinate = gets.chomp.upcase
        if coordinate.upcase == 'END'
            puts("End of game. Nobody wins")
            exited = true
        elsif ((coordinate.length != 2) or (not coordinate[0, 1].between?('A','C')) or (not coordinate[1, 1].between?('1', '3'))) 
            puts("#{coordinate} is not a valid coordinate value.")
            puts("Try it again please")
            sleep(3)
            coordinate = ''
            exited = false
        end
        return coordinate, exited
    end

    private
    def new_game()
        # Clean board
        @board.clear_board()
        # Set turn
        @turn = ""
        # Clear players moves
        @@PLAYER_NAMES.each do |name|
            @players[name].new_game()
        end
    end

    def get_initial_player()
        valid = false
        turn = ''
        until valid do
            puts `clear`
            puts("Wellcome to our game - TIC-TAC-TOE")
            puts("What's the letter of the first player? (#{@@PLAYER_NAMES[0]} or #{@@PLAYER_NAMES[1]})")
            turn = gets.chomp.upcase
            # DEBUG # puts @turn.length == 1
            # DEBUG # puts ['X', 'O'].include? @turn
            valid = ((turn.length == 1) and (@@PLAYER_NAMES.include? turn))
        end
        return turn
    end

end

game = Game.new
game.play_game()
