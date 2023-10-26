class Player
    attr_reader :name
    attr_reader :movements

    def initialize(game, name)
        @movements = []
        @name = name
        @game = game
        # puts("new player #{@sign} created")
    end

    def make_move(coordinate)
        error, error_message = @game.board.make_move(@name, coordinate)
        if error == false
            @movements.append(coordinate)
        end
        return error, error_message
    end

    def wins?()
        # Check if player wins
        return @game.board.check_winner(@movements)
    end
   
    def new_game()
        # Clean moves
        @movements.clear()
    end

end