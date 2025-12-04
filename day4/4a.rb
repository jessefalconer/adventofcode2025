require "matrix"

GRID = Matrix[*File.readlines("day4/sample.txt", chomp: true).map { _1.chars }].freeze
DOMAIN, RANGE = GRID.column_count - 1, GRID.row_count - 1
COORD_RULES = [
  ->(r, c) { [r - 1, c] if r.positive? },
  ->(r, c) { [r + 1, c] if r < RANGE },
  ->(r, c) { [r - 1, c - 1] if r.positive? && c.positive? },
  ->(r, c) { [r - 1, c + 1] if r.positive? && c < DOMAIN },
  ->(r, c) { [r, c - 1] if c.positive? },
  ->(r, c) { [r, c + 1] if c < DOMAIN },
  ->(r, c) { [r + 1, c + 1] if r < RANGE && c < DOMAIN },
  ->(r, c) { [r + 1, c - 1] if r < RANGE && c.positive? }
].freeze
ROLL = "@".freeze
EMPTY = ".".freeze

def check_adjacent(row, col)
 COORD_RULES.count do |rule|
    position = rule.call(row, col)

    position && GRID[*position] == ROLL
  end < 4
end

result = GRID.each_with_index.count do |cell, row, col|
  cell != EMPTY && check_adjacent(row, col)
end

puts result
