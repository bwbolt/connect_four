class Menu
  def prompt
    p 'Enter p to play. Enter t to play two player. Enter q to quit.'
    print '>'
    gets.chomp.downcase
  end

  def check_input_validity(user_input)
    input = user_input
    until %w[p t q].include?(input)
      p 'Please enter valid response. p or t or q.'
      print '>'
      input = gets.chomp.downcase
    end
    input
  end

  def input_coordinator(user_input)
    game = Game.new
    if user_input == 'p'
      game.start
    elsif user_input == 't'
      game.start_two_player
    elsif user_input == 'q'
      p 'Hope to see you again soon! Goodbye!'
    end
  end
end
