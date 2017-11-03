class Board
    attr_reader :game_cells

    def initialize
        @game_cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end

    # Displays current board to console
    def display_board
        puts "\n"
        puts " #{@game_cells[0]} | #{@game_cells[1]} | #{@game_cells[2]}"
        puts "---+---+---"
        puts " #{@game_cells[3]} | #{@game_cells[4]} | #{@game_cells[5]}"
        puts "---+---+---"
        puts " #{@game_cells[6]} | #{@game_cells[7]} | #{@game_cells[8]}"
    end

    # Checks is space is taken
    def valid_move?(location)
        if @game_cells[(location.to_i - 1)].class == Fixnum 
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
    def win_game?

        if # Horizontal wins
            ( @game_cells[0] == @game_cells[1] && @game_cells[1] == @game_cells[2] ) ||
            ( @game_cells[3] == @game_cells[4] && @game_cells[4] == @game_cells[5] ) ||
            ( @game_cells[6] == @game_cells[7] && @game_cells[7] == @game_cells[8] ) ||
            # Verticle wins
            ( @game_cells[0] == @game_cells[3] && @game_cells[3] == @game_cells[6] ) ||
            ( @game_cells[1] == @game_cells[4] && @game_cells[4] == @game_cells[7] ) ||
            ( @game_cells[2] == @game_cells[5] && @game_cells[5] == @game_cells[8] ) ||
            # Diagnol wins
            ( @game_cells[0] == @game_cells[4] && @game_cells[4] == @game_cells[8] ) ||
            ( @game_cells[6] == @game_cells[4] && @game_cells[4] == @game_cells[2] )

            true
        else
            false
        end
    end

    # Checks if game is tied by seeing if any integers are left in @game_cells
    def tie_game?
        tie = true
        @game_cells.each do |cell|
            if cell.class == Fixnum
                tie = false
            end
        end
        tie
    end

    # Checks if game is over
    def game_over?
        win_game? || tie_game?
    end
end