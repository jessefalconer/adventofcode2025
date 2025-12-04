require "matrix"

counter = 0
grid = Matrix[*File.readlines("day4/sample.txt", chomp: true).map { _1.chars }]
DOMAIN, RANGE = grid.column_count - 1, grid.row_count - 1
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

def check_adjacent(row, col, grid)
 COORD_RULES.count do |rule|
    position = rule.call(row, col)

    position && grid[*position] == ROLL
  end < 4
end

loop do
  changed = false

  grid.each_with_index do |cell, row, col|
    next if cell == EMPTY

    if check_adjacent(row, col, grid)
      counter += 1
      grid[row, col] = EMPTY
      changed = true
    end
  end

  break unless changed
end

puts counter
