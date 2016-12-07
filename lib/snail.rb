require 'pry'

module Snail

  DIRECTIONS = %i[right down left up]

  def solve(matrix)
    return [] if matrix == [[]]
    _matrix = Marshal.load(Marshal.dump(matrix))
    cycle = DIRECTIONS.cycle
    accum = []
    while (parts = send(cycle.next, _matrix)) do
      accum += parts
    end
    accum
  end

  def right(matrix)
    matrix.shift
  end

  def down(matrix)
    matrix.map(&:pop)
  end

  def left(matrix)
    row = matrix.pop
    row ? row.reverse : nil
  end

  def up(matrix)
    matrix.reverse.map(&:shift)
  end

  extend self
end

