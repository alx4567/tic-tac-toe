class Board
    attr_reader :game_cells

    def initialize
        @game_cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    # Displays current board to console
    def display_board
        puts "\n Game Board        Key"
        puts "\n"
        puts " #{@game_cells[0]} | #{@game_cells[1]} | #{@game_cells[2]}      1 | 2 | 3"
        puts "---+---+---    ---+---+---"
        puts " #{@game_cells[3]} | #{@game_cells[4]} | #{@game_cells[5]}      4 | 5 | 6"
        puts "---+---+---    ---+---+---"
        puts " #{@game_cells[6]} | #{@game_cells[7]} | #{@game_cells[8]}      7 | 8 | 9"
    end

    # Checks is space is taken
    def valid_move?(location)
        if @game_cells[(location.to_i - 1)] == " "
            true
        else
            false
        end
    end

    # Places current player's symbol on board
    def mark_player_move(position, symbol)
        @game_cells[(position-1)] = symbol
    end

    # Checks to see if current player has won game
    def win_game?(symbol)

        if # Horizontal wins
            ( @game_cells[0] == symbol && @game_cells[1] == symbol && @game_cells[2] == symbol ) ||
            ( @game_cells[3] == symbol && @game_cells[4] == symbol && @game_cells[5] == symbol) ||
            ( @game_cells[6] == symbol && @game_cells[7] == symbol && @game_cells[8] == symbol) ||
            # Verticle wins
            ( @game_cells[0] == symbol && @game_cells[3] == symbol && @game_cells[6] == symbol ) ||
            ( @game_cells[1] == symbol && @game_cells[4] == symbol && @game_cells[7] == symbol ) ||
            ( @game_cells[2] == symbol && @game_cells[5] == symbol && @game_cells[8] == symbol ) ||
            # Diagnol wins
            ( @game_cells[0] == symbol && @game_cells[4] == symbol && @game_cells[8] == symbol ) ||
            ( @game_cells[6] == symbol && @game_cells[4] == symbol && @game_cells[2] == symbol )

            true
        else
            false
        end
    end

    # Checks if game is tied by seeing if any integers are left in @game_cells
    def tie_game?
        tie = true
        @game_cells.each do |cell|
            if cell == " "
                tie = false
            end
        end
        tie
    end

    def reset_board
        @game_cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def play_again?
        puts "Do you want to play again? (y/n)"

        while reset_game = gets.chomp
            case reset_game.downcase
            when "y"
                reset_game = false
                reset_board
                break
            when "n"
                reset_game = true
                puts "See you later!"
                break
            else
                puts "Invalid input. Try again."
            end
        end
        reset_game
    end
end