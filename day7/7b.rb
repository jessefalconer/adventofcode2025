# BEAM = "S".freeze
# SPLITTER = "^".freeze
# OPEN = ".".freeze
# GRID = File.readlines("day7/sample.txt", chomp: true).map(&:chars).freeze
# cache = Hash.new(0)

# GRID.each_with_index do |row, row_index|
#   row.each_with_index do |char, col_index|
#     key = [row_index, col_index]
#     node_visits = cache[key]

#     case char
#     when OPEN
#       cache[[row_index + 1, col_index]] += node_visits
#     when SPLITTER
#       [-1, 1].each do |offset|
#         adjacent = col_index + offset
#         next if adjacent < 0 || adjacent >= row.size

#         cache[[row_index + 1, adjacent]] += node_visits
#       end
#     when BEAM
#       cache[[row_index + 1, col_index]] += 1
#     end
#   end
# end

# puts cache.select { _1[0] == GRID.size }.values.sum


puts cache.inspect
