SIGNEDNESS = { "L" => -1, "R" => 1 }.freeze
current_position = 50
counter = 0

File.foreach("sample.txt").each do |command|
  vector = SIGNEDNESS[command[0]] * (command[1..].to_i % 100)
  scalar = SIGNEDNESS[command[0]] * command[1..].to_i
  counter += ((current_position + scalar) / 100).abs
  counter -= 1 if current_position.zero? && scalar.negative?
  current_position = (current_position + vector) % 100
  counter += 1 if current_position.zero?
end

puts counter # off by 7?
