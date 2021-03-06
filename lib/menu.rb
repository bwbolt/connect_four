class Menu
  def initialize
    @database = Database.new
  end

  def prompt
    p 'Enter p to play. Enter t to play two player. Enter q to quit. Enter l to see leader-board'
    print '>'
    gets.chomp.downcase
  end

  def check_input_validity(user_input)
    input = user_input
    until %w[p t q l].include?(input)
      p 'Please enter valid response. p or t or q or l'
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
    elsif user_input == 'l'
      @database.print_leaderboard
      game.print_main_menu
    end
  end
end
