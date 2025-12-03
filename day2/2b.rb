counter = 0

def check_combinations(number)
  size = number.digits.length
  midpoint = size / 2

  (1..midpoint).map do |group_size|
    next unless size % group_size == 0

    group_count = size / group_size
    groups = number.digits.reverse.each_slice(group_size).to_a

    groups.join.to_i if groups.uniq.one?
  end.compact.uniq
end

File.readlines("day2/sample.txt", chomp: true).join.split(",").each do |range|
  range = range.split("-").map(&:to_i)
  invalid_ids = []

  (range[0]..range[1]).each do |number|
    check_combinations(number).each do |id|
      invalid_ids << id
    end
  end

  counter += invalid_ids.sum
end

puts counter
