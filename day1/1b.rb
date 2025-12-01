# SIGNEDNESS = { "L" => -1, "R" => 1 }.freeze
# current_position = 50
# counter = 0

# File.foreach("sample.txt").each do |command|
#   vector = SIGNEDNESS[command[0]] * (command[1..].to_i % 100)
#   current_position = (current_position + vector) % 100
#   counter += 1 if current_position.zero?
# end

# puts counter

# Adapt me
