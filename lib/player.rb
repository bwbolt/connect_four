require './lib/board'
require './lib/database'
class Player
  attr_reader :name, :token

  def initialize(name, token)
    @name = name
    @token = token
    @database = Database.new
  end

  def change_name(name)
    @name = name
    @database.add_user(name)
    @database.add_game_played(name)
  end

  def enter_names(player1, player2)
    p "Please enter player1's name"
    print '>'
    player1.change_name(gets.chomp)
    p "Please enter player2's name"
    print '>'
    player2.change_name(gets.chomp)
  end
end
