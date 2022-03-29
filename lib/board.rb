class Board
attr_reader :board

  def initialize
    @board = {
      'a' => '.,.,.,.,.,.',
      'b' => '.,.,.,.,.,.',
      'c' => '.,.,.,.,.,.',
      'd' => '.,.,.,.,.,.',
      'e' => '.,.,.,.,.,.',
      'f' => '.,.,.,.,.,.',
      'g' => '.,.,.,.,.,.'
    }
  end

  def print_board
  a = [5, 4, 3, 2, 1, 0]

  puts 'ABCDEFG'
  a.each do |i|
    puts "#{@board['a'].split(',')[i]}#{@board['b'].split(',')[i]}#{@board['c'].split(',')[i]}#{@board['d'].split(',')[i]}#{@board['e'].split(',')[i]}#{@board['f'].split(',')[i]}#{@board['g'].split(',')[i]}"
  end
  end
end



board = Board.new

board.print_board



  
