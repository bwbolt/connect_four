class Turn
attr_reader :board

  def initialize(board)
    @board = board
  end
# require 'pry' ; binding.pry
  def human_turn
    input = gets.chomp.downcase
    until   %w[a b c d e f g].include?(input) && @board.board[input][-1] == '.'
      puts 'Please enter a Valid Space'
      input = gets.chomp.downcase
    end

    @board.board[input].sub!('.', 'X')
  end

  def computer_turn
    options = %w[a b c d e f g]
    random = options.shuffle
    random = options.shuffle until @board.board[random[0]][-1] == '.'

    @board.board[random[0]].sub!('.', 'O')
  end
end