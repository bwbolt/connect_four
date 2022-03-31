require './lib/player'
require './lib/board'

class Game
  attr_reader :player1, :computer_player, :board

  def initialize
    @player1 = Player.new('Player One', 'X')
    @computer_player = Player.new('Computer', 'O')
    @board = Board.new
    @winners = ["#{@board.board['a'][4]},#{@board.board['b'][6]},#{@board.board['c'][8]},#{@board.board['d'][10]}",
                "#{@board.board['a'][2]},#{@board.board['b'][4]},#{@board.board['c'][6]},#{@board.board['d'][8]},#{@board.board['e'][10]}",
                "#{@board.board['a'][0]},#{@board.board['b'][2]},#{@board.board['c'][4]},#{@board.board['d'][6]},#{@board.board['e'][8]},#{@board.board['f'][10]}",
                "#{@board.board['b'][0]},#{@board.board['c'][2]},#{@board.board['d'][4]},#{@board.board['e'][6]},#{@board.board['f'][8]},#{@board.board['g'][10]}",
                "#{@board.board['c'][0]},#{@board.board['d'][2]},#{@board.board['e'][4]},#{@board.board['f'][6]},#{@board.board['g'][8]}",
                "#{@board.board['d'][0]},#{@board.board['e'][2]},#{@board.board['f'][4]},#{@board.board['g'][6]}", # These are the diagonals
                "#{@board.board['a'][6]},#{@board.board['b'][4]},#{@board.board['c'][2]},#{@board.board['d'][0]}",
                "#{@board.board['a'][8]},#{@board.board['b'][6]},#{@board.board['c'][4]},#{@board.board['d'][2]},#{@board.board['e'][0]}",
                "#{@board.board['a'][10]},#{@board.board['b'][8]},#{@board.board['c'][6]},#{@board.board['d'][4]},#{@board.board['e'][2]},#{@board.board['f'][0]}",
                "#{@board.board['b'][10]},#{@board.board['c'][8]},#{@board.board['d'][6]},#{@board.board['e'][4]},#{@board.board['f'][2]},#{@board.board['g'][0]}",
                "#{@board.board['c'][10]},#{@board.board['d'][8]},#{@board.board['e'][6]},#{@board.board['f'][4]},#{@board.board['g'][2]}",
                "#{@board.board['d'][10]},#{@board.board['e'][8]},#{@board.board['f'][6]},#{@board.board['g'][4]}",

                @board.board['a'], @board.board['b'], @board.board['c'], @board.board['d'], @board.board['e'], @board.board['f'], @board.board['g'], # These are the veritcals

                "#{@board.board['a'][0]},#{@board.board['b'][0]},#{@board.board['c'][0]},#{@board.board['d'][0]},#{@board.board['e'][0]},#{@board.board['f'][0]},#{@board.board['g'][0]}",
                "#{@board.board['a'][2]},#{@board.board['b'][2]},#{@board.board['c'][2]},#{@board.board['d'][2]},#{@board.board['e'][2]},#{@board.board['f'][2]},#{@board.board['g'][2]}",
                "#{@board.board['a'][4]},#{@board.board['b'][4]},#{@board.board['c'][4]},#{@board.board['d'][4]},#{@board.board['e'][4]},#{@board.board['f'][4]},#{@board.board['g'][4]}",
                "#{@board.board['a'][6]},#{@board.board['b'][6]},#{@board.board['c'][6]},#{@board.board['d'][6]},#{@board.board['e'][6]},#{@board.board['f'][6]},#{@board.board['g'][6]}", # These are the horizontals
                "#{@board.board['a'][8]},#{@board.board['b'][8]},#{@board.board['c'][8]},#{@board.board['d'][8]},#{@board.board['e'][8]},#{@board.board['f'][8]},#{@board.board['g'][8]}",
                "#{@board.board['a'][10]},#{@board.board['b'][10]},#{@board.board['c'][10]},#{@board.board['d'][10]},#{@board.board['e'][10]},#{@board.board['f'][10]},#{@board.board['g'][10]}"]

  end

  def start
    @board.print_board

    until @board.draw
      recycle_winners
      input = gets.chomp.downcase # This is for getting user input from user

      @board.board[input].sub!('.', 'X')

      @board.print_board

      recycle_winners
      if winner?('X')
        p 'Player One is the Winner!!!'

        break
      end

      # print 'Computer calculating'
      # sleep(1)
      # print '.' # This bit here makes it look like the computer is thinking.
      # sleep(1)
      # puts '.'

      options = %w[a b c d e f g]
      random = options.shuffle

      @board.board[random[0]].sub!('.', 'O')

      @board.print_board
      recycle_winners

      if winner?('O')
        p 'The almighty computer has won...'
        break
      end

    end
    p "It's a DRAW!!" if @board.draw
  end

  def recycle_winners
    @winners = ["#{@board.board['a'][4]},#{@board.board['b'][6]},#{@board.board['c'][8]},#{@board.board['d'][10]}",
                "#{@board.board['a'][2]},#{@board.board['b'][4]},#{@board.board['c'][6]},#{@board.board['d'][8]},#{@board.board['e'][10]}",
                "#{@board.board['a'][0]},#{@board.board['b'][2]},#{@board.board['c'][4]},#{@board.board['d'][6]},#{@board.board['e'][8]},#{@board.board['f'][10]}",
                "#{@board.board['b'][0]},#{@board.board['c'][2]},#{@board.board['d'][4]},#{@board.board['e'][6]},#{@board.board['f'][8]},#{@board.board['g'][10]}",
                "#{@board.board['c'][0]},#{@board.board['d'][2]},#{@board.board['e'][4]},#{@board.board['f'][6]},#{@board.board['g'][8]}",
                "#{@board.board['d'][0]},#{@board.board['e'][2]},#{@board.board['f'][4]},#{@board.board['g'][6]}", # These are the diagonals
                "#{@board.board['a'][6]},#{@board.board['b'][4]},#{@board.board['c'][2]},#{@board.board['d'][0]}",
                "#{@board.board['a'][8]},#{@board.board['b'][6]},#{@board.board['c'][4]},#{@board.board['d'][2]},#{@board.board['e'][0]}",
                "#{@board.board['a'][10]},#{@board.board['b'][8]},#{@board.board['c'][6]},#{@board.board['d'][4]},#{@board.board['e'][2]},#{@board.board['f'][0]}",
                "#{@board.board['b'][10]},#{@board.board['c'][8]},#{@board.board['d'][6]},#{@board.board['e'][4]},#{@board.board['f'][2]},#{@board.board['g'][0]}",
                "#{@board.board['c'][10]},#{@board.board['d'][8]},#{@board.board['e'][6]},#{@board.board['f'][4]},#{@board.board['g'][2]}",
                "#{@board.board['d'][10]},#{@board.board['e'][8]},#{@board.board['f'][6]},#{@board.board['g'][4]}",

                @board.board['a'], @board.board['b'], @board.board['c'], @board.board['d'], @board.board['e'], @board.board['f'], @board.board['g'], # These are the veritcals

                "#{@board.board['a'][0]},#{@board.board['b'][0]},#{@board.board['c'][0]},#{@board.board['d'][0]},#{@board.board['e'][0]},#{@board.board['f'][0]},#{@board.board['g'][0]}",
                "#{@board.board['a'][2]},#{@board.board['b'][2]},#{@board.board['c'][2]},#{@board.board['d'][2]},#{@board.board['e'][2]},#{@board.board['f'][2]},#{@board.board['g'][2]}",
                "#{@board.board['a'][4]},#{@board.board['b'][4]},#{@board.board['c'][4]},#{@board.board['d'][4]},#{@board.board['e'][4]},#{@board.board['f'][4]},#{@board.board['g'][4]}",
                "#{@board.board['a'][6]},#{@board.board['b'][6]},#{@board.board['c'][6]},#{@board.board['d'][6]},#{@board.board['e'][6]},#{@board.board['f'][6]},#{@board.board['g'][6]}", # These are the horizontals
                "#{@board.board['a'][8]},#{@board.board['b'][8]},#{@board.board['c'][8]},#{@board.board['d'][8]},#{@board.board['e'][8]},#{@board.board['f'][8]},#{@board.board['g'][8]}",
                "#{@board.board['a'][10]},#{@board.board['b'][10]},#{@board.board['c'][10]},#{@board.board['d'][10]},#{@board.board['e'][10]},#{@board.board['f'][10]},#{@board.board['g'][10]}"]
  end

  def winner?(sym)
    @winners.any? { |e| e.include?("#{sym},#{sym},#{sym},#{sym}") }
  end
end
