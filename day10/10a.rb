require "matrix"

presses = []
instructions = File.readlines("day10/sample.txt", chomp: true).map do |line|
  indicators, buttons, _voltage = line.match(/\A(\[[^\]]+\])\s+(.*?)\s+(\{[^}]+\})\z/).captures
  indicators = indicators[1..-2].chars.map { _1 == "#" ? 1 : 0 }
  buttons = buttons.scan(/\(([^)]+)\)/).map do |match|
    match.first.split(",").map(&:to_i)
  end
  buttons = buttons.map do |button|
    (0...indicators.size).map { button.include?(_1) ? 1 : 0 }
  end

  [indicators, buttons]
end

instructions.each do |indicators, buttons|
  a = Matrix[*buttons]
  b = indicators

  least_presses = nil

  (0...(1 << a.row_count)).each do |combo|
    result = Array.new(b.size, 0)
    count = 0

    a.row_count.times do |i|
      next if ((combo >> i) & 1).zero?

      count += 1
      result = result.zip(a.row(i).to_a).map { (_1 + _2) & 1 }
    end

    if result == b
      least_presses = count if least_presses.nil? || count < least_presses
    end
  end

  presses << best
end

puts presses.sum
