# require './lib/game'

p "Welcome to CONNECT FOUR"
p "Enter p to play. Enter q to quit."

def user_response
  user_input = nil
  until user_input == "p" || user_input == "q"
    user_input = gets.chomp
  end
  if user_input == "p"
    game.start
  elsif user_input == "q"
    p "Hope to see you again soon! Goodbye!"
  end
end

user_response
