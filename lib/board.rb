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
    puts 'ABCDEFG'
    [5, 4, 3, 2, 1, 0].each do |i|
      row = ''
      %w[a b c d e f g].each { |column| row << @board[column].split(',')[i] }
      puts row
    end
  end

  def draw
    @board.all? { |_key, column| !column.include?('.') }
  end
end
