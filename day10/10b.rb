require "matrix"

presses = []
instructions = File.readlines("day10/sample.txt", chomp: true).map do |line|
  indicators, buttons, voltage = line.match(/\A(\[[^\]]+\])\s+(.*?)\s+(\{[^}]+\})\z/).captures
  indicators = indicators[1..-2].chars.map { _1 == "#" ? 1 : 0 }
  buttons = buttons.scan(/\(([^)]+)\)/).map do |match|
    match.first.split(",").map(&:to_i)
  end
  buttons = buttons.map do |button|
    (0...indicators.size).map { button.include?(_1) ? 1 : 0 }
  end
  voltage = voltage[1..-2].split(",").map(&:to_i)

  [buttons, voltage]
end

instructions.each do |buttons, voltage|
  # (0..buttons.size.factorial) 4! for first line
  # given: [.##.] (3) (1,3) (2) (2,3) (0,2) (0,1) {3,5,4,7}
  (0..24).to_a.repeated_permutation(6) do |solution|
    solution = solution.map(&:to_i)

    # solves first line only
    next unless solution[4] + solution[5] == 3
    next unless solution[1] + solution[5] == 5
    next unless solution[2] + solution[3] + solution[4] == 4
    next unless solution[0] + solution[1] + solution[3] == 7
    break presses << solution.sum
  end
end

puts presses.sum
