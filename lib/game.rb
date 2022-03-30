class Game
  attr_reader :player1, :computer_player, :board

  def initialize
    @player1 = Player.new('Player One', 'X')
    @computer_player = Player.new('Computer', 'O')
    @board = Board.new
  end
end
