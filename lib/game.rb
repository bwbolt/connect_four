require './lib/player'
require './lib/board'

class Game
  attr_reader :player1, :computer_player, :board

  def initialize
    @player1 = Player.new('Player One', 'X')
    @computer_player = Player.new('Computer', 'O')
    @board = Board.new
  end

  def start
    while true

      input = gets.chomp.downcase

      @board[input].sub!('.', 'X')

      puts 'ABCDEFG'
      a.each do |i|
        puts "#{@board['a'].split(',')[i]}#{@board['b'].split(',')[i]}#{@board['c'].split(',')[i]}#{@board['d'].split(',')[i]}#{@board['e'].split(',')[i]}#{@board['f'].split(',')[i]}#{@board['g'].split(',')[i]}"
      end

      if @board.any? { |_key, value| value.include?('X,X,X,X') }
        p "#{@player1.name} is the Winner!!!"
        break
      end

      print 'Computer calculating'
      sleep(1)
      print '.'                             # This bit here makes it look like the computer is thinking.
      sleep(1)
      puts '.'

      options = %w[a b c d e f g]
      random = options.shuffle

      @board[random[0]].sub!('.', 'O')

      puts 'ABCDEFG'
      a.each do |i|
        puts "#{@board['a'].split(',')[i]}#{@board['b'].split(',')[i]}#{@board['c'].split(',')[i]}#{@board['d'].split(',')[i]}#{@board['e'].split(',')[i]}#{@board['f'].split(',')[i]}#{@board['g'].split(',')[i]}"
      end

      next unless @board.any? { |_key, value| value.include?('O,O,O,O') }

      p 'The almighty computer has won...'
      p 'Better luck next time HUMANNNNNN'
      break
    end
  end
end
