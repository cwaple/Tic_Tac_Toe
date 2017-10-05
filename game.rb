class Game
  def initialize(player_one, player_two, board, whos_turn)
    @player_one = player_one
		@player_two = player_two
		@board = board
		@whos_turn = whos_turn
		@turn = 0
	end

	def get_whos_turn
		@whos_turn
	end

	def play_move(cell)
		@board.set_cell(cell, @whos_turn.get_token) ? print("Move sucessful!\n#{@board.display}") : (return "Position not open. Repeat turn.")
		@whos_turn == @player_one ? @whos_turn = @player_two : @whos_turn = @player_one
		@turn += 1
	end
	
	def game_over?
		return false unless @turn >= 5
		return true if check_solutions(@player_one, 0, 1, 2) || check_solutions(@player_two, 0, 1, 2)
		return true if check_solutions(@player_one, 0, 3, 6) || check_solutions(@player_two, 0, 3, 6)
		return true if check_solutions(@player_one, 0, 4, 8) || check_solutions(@player_two, 0, 4, 8)
		return true if check_solutions(@player_one, 1, 4, 7) || check_solutions(@player_two, 1, 4, 7)
		return true if check_solutions(@player_one, 2, 5 ,8) || check_solutions(@player_two, 2, 5 ,8)
		return true if check_solutions(@player_one, 2, 4, 6) || check_solutions(@player_two, 2, 4, 6)
		return true if check_solutions(@player_one, 3, 4, 5) || check_solutions(@player_two, 3, 4, 5)
		return true if check_solutions(@player_one, 6, 7, 8) || check_solutions(@player_two, 6, 7, 8)
		if @turn == 9
			puts "It is a draw!"
			return true
		end
		false 
	end

	def get_board
		@board
	end

	def reset_game
		@board.reset_board
		@turn = 0
	end

	def check_solutions(player, pos_one, pos_two, pos_three)
		game_board = @board.get_board_array
		if ([game_board[pos_one], game_board[pos_two], game_board[pos_three]].all? {|x| x == player.get_token})
			puts "#{player.get_name} wins!" 
			return true 
		end 
		false 
	end
end