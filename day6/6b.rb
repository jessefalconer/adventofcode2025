require "matrix"
  
DATA = File.readlines("day6/sample.txt", chomp: true).map { _1.chars }.freeze
OPERATORS = DATA.last.freeze
MATRIX = Matrix[*DATA[0..-2]].freeze

def blank_column?(index)
  MATRIX.column(index).to_a.all? { _1 == " " }
end

total = 0
minor_operator, minor_numbers = nil, []

OPERATORS.each_with_index do |operator, index|
  next if blank_column?(index)
  
  minor_operator ||= operator.to_sym
  minor_numbers << MATRIX.column(index).to_a.join.to_i
  
  next unless blank_column?(index + 1)
  
  total += minor_numbers.reduce(minor_operator)
  minor_operator, minor_numbers = nil, []
end

puts total
