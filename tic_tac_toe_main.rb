require './board'
require './player'
require './game'

board = Board.new

puts "Enter player one's name: "
p1_name = gets.strip
puts "Enter player two's name: "
p2_name = gets.strip

player_one = Player.new(p1_name, "x")
player_two = Player.new(p2_name, "y")

game = Game.new(player_one, player_two, board, player_one)

game.get_board.display
cell = 0

while !game.game_over?
  puts "#{game.get_whos_turn.get_name}, select a cell: "
  cell = gets.to_i
  game.play_move(cell)
end