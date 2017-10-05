class Board
  def initialize()
  	@board = (1..9).to_a
  end

  def display
		puts @board[0..2].inspect
		puts @board[3..5].inspect
		puts @board[6..8].inspect
  end

  def set_cell(cell_num, player_token)
		if @board[cell_num] == cell_num+1 then
			@board[cell_num] = player_token
			return true
		else 
			return false
    end
  end

  def get_board_array
  	@board
	end
	
	def reset_board
		@board = (1..9).to_a
	end
end