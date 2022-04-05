require 'Bigbertha'

class Database
  def initialize
    @ref = Bigbertha::Ref.new('https://connect-four-9871b-default-rtdb.firebaseio.com/')
  end

  def get_all_users
    @ref.child.read
  end

  def add_user(name)
    all_users = get_all_users
    unless @ref.child.read.keys.include?(name)
      all_users[name] = { "games_played": 0, "games_won": 0, "win_percentage": 0 }
      @ref.set(all_users)
    end
  end

  def add_game_played(name)
    user_info = @ref.child(name).read
    games_played = user_info['games_played']
    games_won = user_info['games_won']
    @ref.child(name).update("games_played": games_played += 1)
    @ref.child(name).update("win_percentage": games_won.to_f / games_played)
  end

  def add_game_won(name)
    user_info = @ref.child(name).read
    games_played = user_info['games_played']
    games_won = user_info['games_won']
    @ref.child(name).update("games_won": games_won += 1)
    @ref.child(name).update("win_percentage": games_won.to_f / games_played)
  end

  def print_leaderboard
    puts 'LEADERBOARD'
    puts '----------------------------------'
    sorted_players = @ref.child.read.sort_by { |_player, stats| stats['win_percentage'] }.reverse
    rank = 1
    player_names = sorted_players.each do |player, stats|
      puts "#{rank}:#{player} has a win percentage of #{(stats['win_percentage'] * 100).round(2)}%"
      rank += 1
    end
    puts '----------------------------------'
  end
end
