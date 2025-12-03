CELLS_NEEDED = 12 # or 2
counter = 0

File.foreach("day3/sample.txt", chomp: true).each do |bank|
  str = ""
  bank_array = bank.chars

  while str.length < CELLS_NEEDED
    domain = bank_array.size + str.length - CELLS_NEEDED
    max = bank_array[0..domain].max
    str += max
    max_at = bank_array.index(max)
    bank_array = bank_array[(max_at + 1)..]
  end

  counter += str.to_i
end

puts counter
