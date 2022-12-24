class Player
    attr_reader :side
    def initialize(side)
        @side = side
    end
end

class Board
    attr_accessor :squares
    def initialize
        @squares = [
            ['-','-','-'],
            ['-','-','-'],
            ['-','-','-']
        ]
    end
    def turn(player, square)
        squares[square[0]][square[1]] = player.side
    end
end

player1 = Player.new('X')
player2 = Player.new('O')
board = Board.new
p(board.squares)
board.turn(player1, [0, 1])
p(board.squares)
while gameOver = false
   if test
    
   end
   currentPlayer = player1
   board.turn(currentPlayer, gets("Enter two squares to place your X"))
   if test

   end
   currentPlayer = player2