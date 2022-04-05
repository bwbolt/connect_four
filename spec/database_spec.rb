require 'rspec'
require './lib/database'

describe Database do
  it 'exists' do
    database = Database.new
    expect(database).to be_a Database
  end

  it 'can get all users and add a user' do
    database = Database.new
    expect(database.get_all_users).to be_a Hash
    expect(database).to respond_to(:add_user)
  end
  it 'can ass game played to user and games won' do
    database = Database.new
    expect(database).to respond_to(:add_game_played)
    expect(database).to respond_to(:add_game_won)
  end
  it 'can print the leaderboard' do
    database = Database.new
    expect(database).to respond_to(:print_leaderboard)
  end
end
