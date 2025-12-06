total = File.readlines("day6/sample.txt", chomp: true)
  .map { _1.strip.split(/\s+/) }
  .transpose
  .sum do |*numbers, operator|
    numbers.map(&:to_i).reduce(operator.to_sym)
  end

puts total
