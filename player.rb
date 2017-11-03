# Creates players
class Player
    attr_reader :name, :symbol

    def initialize(name, symbol)
        @name = name
        @symbol = symbol
    end

    # 
    def player_move
        puts "\n#{@name}'s turn. Choose a cell"

        # Tests if response is 1-9
        while @cell_picked = gets.chomp
            case @cell_picked.to_i
            when 1..9
                break
            else
                puts "\nInvalid response. Try again"
            end
        end
        @cell_picked
    end
end



# class Player
#     attr_reader :symbol, :name

#     def initialize(name, marker)
#         @name = name
#         @marker = marker
#     end

#     def make_play
#         puts "#{@name}, choose a position"
#         position = gets.chomp.downcase
        
#         unless (1..9) !== position
#             puts "that's not a valid position. Try again"
#             sleep 1
#         end
#         position
#     end
# end