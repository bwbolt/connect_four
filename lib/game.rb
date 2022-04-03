require './lib/player'
require './lib/board'
require './lib/turn'
require './lib/menu'

class Game
  attr_reader :player1, :player2, :board

  def initialize
    @player1 = Player.new('Player One', 'X')
    @player2 = Player.new('Computer', 'O')
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
      turn = Turn.new(@board)
      recycle_winners
      turn.human_turn(@player1)

      @board.print_board

      recycle_winners

      if winner?('X')
        p 'Player One is the Winner!!!'

        print_main_menu
        exit
      end

      print 'Computer calculating'
      sleep(1)
      print '.' # This bit here makes it look like the computer is thinking.
      sleep(1)
      puts '.'

      turn.computer_turn

      @board.print_board
      recycle_winners

      next unless winner?('O')

      p 'The almighty computer has won...'
      # break
      print_main_menu
      exit
    end
    p "It's a DRAW!!" if @board.draw
    print_main_menu
  end

  def start_two_player
    p "Please enter player1's name"
    print '>'
    @player1.change_name(gets.chomp)
    p "Please enter player2's name"
    print '>'
    @player2.change_name(gets.chomp)

    @board.print_board

    until @board.draw
      turn = Turn.new(@board)
      recycle_winners
      turn.human_turn(@player1)

      @board.print_board

      recycle_winners

      if winner?('X')
        p "#{@player1.name} is the Winner!!!"

        print_main_menu
        exit
      end

      turn.human_turn(@player2)

      @board.print_board

      recycle_winners

      next unless winner?('O')

      p "#{@player2.name} is the Winner!!!"

      print_main_menu
      exit
    end

    p "It's a DRAW!!" if @board.draw
    print_main_menu
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

  def print_main_menu
    menu = Menu.new
    user_input = menu.prompt
    menu.check_input_validity(user_input)
    menu.input_coordinator(user_input)
  end
end
