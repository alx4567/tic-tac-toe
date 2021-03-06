require './board.rb'
require './player.rb'

board = Board.new

# Getting player 1 info
puts "Player 1, enter your name."
name1 = gets.chomp
puts "\nWelcome, #{name1}. Do you want to be X's or O's?"

# Checks for correct input
while player1_symbol = gets.upcase.chomp
    case player1_symbol
    when "X"
        puts "\nGreat. You will be using #{player1_symbol}'s"
        sleep 1
        break
    when "O"
        puts "\nGreat. You will be using #{player1_symbol}'s"
        sleep 1
        break
    else
        puts "\nInvalid response. Please try again"
    end
end

player1 = Player.new(name1, player1_symbol)

#Getting player 2 info
puts "\nPlayer 2, enter your name"
name2 = gets.chomp
player2_symbol = if player1_symbol == "X"
                    "O"
                 else
                    "X"
                 end
player2 = Player.new(name2, player2_symbol)
puts "\nWelcome, #{name2}. You will be playing with #{player2_symbol}'s"
sleep 1

active_player = player1
stop = false

# Play Game
until stop
    board.display_board
    
    # Gets active players move and tests its validity
    while players_move = active_player.player_move
        if board.valid_move?(players_move)
            break
        else
            puts "Space already taken. Try again."
        end
    end

    board.mark_player_move(players_move.to_i, active_player.symbol)

    if board.win_game?(active_player.symbol)
        board.display_board
        puts "\n#{active_player.name} has won!"
        stop = board.play_again?
    elsif board.tie_game?
        board.display_board
        puts "\nYou have tied!"
        stop = board.play_again?
    else
        if active_player == player1
            active_player = player2
        else
            active_player = player1
        end
    end
end

