class Board

  def initialize
  end

  def board
    field = {
      'a' => '.,.,.,.,.,.',
      'b' => '.,.,.,.,.,.',
      'c' => '.,.,.,.,.,.',
      'd' => '.,.,.,.,.,.',
      'e' => '.,.,.,.,.,.',
      'f' => '.,.,.,.,.,.',
      'g' => '.,.,.,.,.,.'
    }
    field.each do |key, value|
      make_string = "#{key}#{value}"
      make_string.split(",")
      print make_string
    end
  end

  # def drawBoard
  #       board = Hash.new
  #       (1..6).each do |i|
  #       ('a'..'g').each do |letter|
  #               board["#{i}#{letter}"] = "*"
  #               print board["#{i}#{letter}"]
  #           end
  #           puts
  #       end
  # end
end

board = Board.new
p board.board

# p board.drawBoard
# board = Board.new
# p board.board
