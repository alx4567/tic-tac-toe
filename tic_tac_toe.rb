# Creates players
class Player
    attr_reader :name, :symbol

    def initialize(name, symbol)
        @name = name
        @symbol = symbol
    end

    def current_player_move
        puts "#{@player}'s turn"
        @cell_picked = gets.chomp

        case cell_picked
        when 1..9
            mark_player_move(@cell_picked, @symbol)
        else
            puts "Invalid Input. Try again"
        end
    end
end


class Board
    def initialize
        @game_cells = %w[1 2 3 4 5 6 7 8 9]
    end

    # Displays current board to console
    def display_board
        puts "#{@game_cells[0]} | #{@game_cells[1]} | #{@game_cells[2]}"
        puts "--+---+--"
        puts "#{@game_cells[3]} | #{@game_cells[4]} | #{@game_cells[5]}"
        puts "--+---+--"
        puts "#{@game_cells[6]} | #{@game_cells[7]} | #{@game_cells[8]}"
    end

    # Places current player's symbol on board
    def mark_player_move(position, symbol)
        @game_cells[position] = marker
    end

    # Checks to see if current player has won game
    def win_game?(player_symbol)
        @player_symbol = player_symbol

        if # Horizontal wins
            ( @game_cells[0] == @player_symbol && @game_cells[1] == @player_symbol && @game_cells[0] == @player_symbol ) ||
            ( @game_cells[3] == @player_symbol && @game_cells[4] == @player_symbol && @game_cells[5] == @player_symbol ) ||
            ( @game_cells[6] == @player_symbol && @game_cells[7] == @player_symbol && @game_cells[8] == @player_symbol ) ||
            # Verticle wins
            ( @game_cells[0] == @player_symbol && @game_cells[3] == @player_symbol && @game_cells[6] == @player_symbol ) ||
            ( @game_cells[1] == @player_symbol && @game_cells[4] == @player_symbol && @game_cells[7] == @player_symbol ) ||
            ( @game_cells[2] == @player_symbol && @game_cells[5] == @player_symbol && @game_cells[8] == @player_symbol ) ||
            # Diagnol wins
            ( @game_cells[0] == @player_symbol && @game_cells[4] == @player_symbol && @game_cells[8] == @player_symbol ) ||
            ( @game_cells[6] == @player_symbol && @game_cells[4] == @player_symbol && @game_cells[2] == @player_symbol )

            true
        else
            false
        end
    end

    # Checks if game is tied by seeing if any integers are left in @game_cells
    def tie_game?
        if @game_cells.include?(/\d/)
            false
        else
            true
        end
    end

    # Checks if game is over
    def game_over?
        win_game? || tie_game?
    end
end