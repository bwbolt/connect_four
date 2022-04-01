require './lib/board'

class Player
  attr_reader :name, :token

  def initialize(name, token)
    @name = name
    @token = token
  end

  def change_name(name)
    @name = name
  end
end
