require "matrix"
  
DATA = File.readlines("day6/sample.txt", chomp: true).map { _1.chars }.freeze
OPERANDS = DATA.last.freeze
MATRIX = Matrix[*DATA[0..-2]].freeze

def blank_column?(index)
  MATRIX.column(index).to_a.all? { _1 == " " }
end

total = 0
minor_operand = nil
minor_numbers = []

OPERANDS.each_with_index do |operand, index|
  next if blank_column?(index)
  
  minor_operand ||= operand.to_sym
  minor_numbers << MATRIX.column(index).to_a.join.to_i
  
  next unless blank_column?(index + 1) || index + 1 == OPERANDS.size
  
  total += minor_numbers.reduce(minor_operand)
  minor_operand, minor_numbers = nil, []
end

puts total
