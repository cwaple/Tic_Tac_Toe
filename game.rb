class Game
  def initialize(player_one, player_two, board, whos_turn)
    @player_one = player_one
		@player_two = player_two
		@board = board
		@whos_turn = whos_turn
	end

	def get_whos_turn
		@whos_turn
	end

	def play_move(cell)
		@board.set_cell(cell, @whos_turn.get_token) ? puts("Move sucessful!") : (return "Position not open. Repeat turn.")
		@whos_turn == @player_one ? @whos_turn = @player_two : @whos_turn = @player_one
	end


end