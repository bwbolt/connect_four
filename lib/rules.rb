class Rules
  attr_reader :winners

  def initialize(board)
    @board = board
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
