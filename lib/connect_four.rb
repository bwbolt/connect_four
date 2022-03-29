require './lib/game'

p "Welcome to CONNECT FOUR"
p "Enter p to play. Enter q to quit."

def user_response
  p "Enter p to play. Enter q to quit."
    user_input = gets.chomp
  if user_input == "p"
    game.start
  elsif user_input == "q"
    p "Hope to see you again soon! Goodbye!"
  end
end
