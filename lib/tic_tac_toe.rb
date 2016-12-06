class TicTacToe

  def self.parse(input)
    raise ArgumentError, "input is invalid expected 9 characters being X, O or -" unless input =~ /^[XO-]{9}$/
    board = input.split("").each_slice(3).to_a
    new(board)
  end

  WIN_CONDITIONS = [
    [[0, 0], [0, 1], [0, 2]],
    [[0, 0], [1, 1], [2, 2]],
    [[0, 0], [1, 0], [2, 0]],
    [[0, 1], [1, 1], [2, 1]],
    [[0, 2], [1, 2], [2, 2]],
    [[1, 0], [1, 1], [1, 2]],
    [[2, 0], [2, 1], [2, 2]],
    [[0, 2], [1, 1], [2, 0]]
  ]

  attr_reader :board

  def initialize(board)
    @board = board
  end

  def winner
    player = nil
    WIN_CONDITIONS.each do |line|
      player = line.inject(nil) do |memo, (x, y)|
        break nil if board[x][y] == "-"
        memo ||= board[x][y]
        break nil if memo != board[x][y]
        memo
      end
      break if player
    end
    player
  end

end

