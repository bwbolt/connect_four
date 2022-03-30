require './lib/game'

p 'Welcome to CONNECT FOUR'
p 'Enter p to play. Enter q to quit.'

user_input = nil
user_input = gets.chomp until %w[p q].include?(user_input)
if user_input == 'p'
  game = Game.new
  game.start
elsif user_input == 'q'
  p 'Hope to see you again soon! Goodbye!'
end
