counter = 0

File.readlines("day2/sample.txt", chomp: true).join.split(",").each do |range|
  range = range.split("-").map(&:to_i)
  range = (range[0]..range[1])
  evens_range = range.select { _1.digits.length.even? }
  next if evens_range.empty?

  evens_range.each do |number|
    size = number.digits.length
    midpoint = size / 2
    denominator = 10 ** midpoint
    right = number % denominator
    left = number / denominator

    counter += number if left == right
  end
end

puts counter
