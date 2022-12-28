# frozen_string_literal: true

# player class
class Player
  attr_reader :side 
  attr_accessor :scores, :length_sums, :current_player

  def initialize(side)
    @side = side
    @scores = [
      [0, 0, 0],
      [0, 0, 0],
      [0, 0, 0]
    ]
    @length_sums = []
  end

  def sum_player_scores
    scores.each { |score| length_sums.push(score.sum)}
    scores.transpose.each { |score| length_sums.push(score.sum)}
    length_sums.push(scores[0][0] + scores[1][1] + scores[2][2])
    length_sums.push(scores[2][0] + scores[1][1] + scores[0][2])
  end

  def test_game_over(player)
    player.sum_player_scores
    if player.length_sums.include? 15
      game_over = true
      print("Player #{player.side} wins!")
    else
      print("The game continues \n")
      player.length_sums = []
    end
  end
end

# board class
class Board
  attr_accessor :squares, :magic_squares, :game_over, :valid_squares

  def initialize
    @squares = [
      ['-', '-', '-'],
      ['-', '-', '-'],
      ['-', '-', '-']
    ]
    @magic_squares = [
      [4, 9, 2],
      [3, 5, 7],
      [8, 1, 6]
    ]
    @game_over = false
    @valid_squares = ['00', '01', '02', '10', '11', '12', '20', '21', '22']
  end

  def validate_square(square)
    if valid_squares.include? square
      valid_squares.delete(square)
    else
      print("That isn't a valid square \n")
    end
  end

  def turn(player, square)
    if validate_square(square)
      square = [square[0].to_i, square[1].to_i]
      squares[square[0]][square[1]] = player.side
      player.scores[square[0]][square[1]] = magic_squares[square[0]][square[1]]
    end
  end

  def print_board
    squares.each { |row| print("#{row} \n") }
  end
end

player1 = Player.new('X')
player2 = Player.new('O')
board = Board.new
board.print_board
puts("For 2 players. Take sequential turns. X is first to move. To enter the square, enter the array coordinates as a string")
puts("00 is top left. 22 is bottom right. If you enter the wrong input your turn will be skipped.")
while board.game_over == false
  board.turn(player1, gets.strip)
  board.print_board
  player1.test_game_over(player1)
  board.turn(player2, gets.strip)
  board.print_board
  player2.test_game_over(player2)
end
