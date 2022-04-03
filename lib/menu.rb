class Menu
  def prompt
    p 'Enter p to play. Enter t to play two player. Enter q to quit.'
    print '>'
    user_input = gets.chomp.downcase
  end

  def check_input_validity(user_input)
    until %w[p t q].include?(user_input)
      p 'Please enter valid response. p or t or q.'
      print '>'
      user_input = gets.chomp.downcase
    end
  end

  def input_coordinator(user_input)
    if user_input == 'p'
      game = Game.new
      game.start
    elsif user_input == 't'
      game = Game.new
      game.start_two_player
    elsif user_input == 'q'
      p 'Hope to see you again soon! Goodbye!'
    end
  end
end
