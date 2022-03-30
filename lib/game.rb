class Game
  def initialize
    @player1 = Player.new('Player One', 'X')
    @computer_player = Player.new('Computer', 'O')
    @board = Board.new
  end
end
