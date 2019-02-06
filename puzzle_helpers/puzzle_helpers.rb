# Solve puzzle method
# Extracts odd and even numbers from an array
# Returns odd or even if the count is one
# Raises error if the puzzle array length is not greater than three
# Raises error if the puzzle cannot be solved
# @example
#   puzzle = [22, 24, 0, 100, 4, 111, 2602]
#   solve_puzzle(puzzle)
# @return [Integer] number
# @param [Array] puzzle, number array
def solve_puzzle(puzzle)
  raise 'puzzle not valid, must be larger than three numbers' if puzzle.count < 3
  even = puzzle.select(&:even?)
  odd = puzzle.select(&:odd?)

  answer = if even.count == 1
    even.first
  elsif odd.count == 1
    odd.first
  else
    raise 'Puzzle does not include an outliner number, please try again'
  end

  answer
end