POINTS = File.readlines("day8/sample.txt", chomp: true).map do |line|
  line.split(",").map(&:to_f)
end.freeze

def calculate_distance(point_0, point_1)
  x0, y0, z0 = point_0
  x1, y1, z1 = point_1

  Math.sqrt(
    (x0 - x1) ** 2 +
    (y0 - y1) ** 2 +
    (z0 - z1) ** 2
  )
end

nearest_neighbours = POINTS.map do |i|
  candidates = POINTS.reject { _1 == i }
  nearest = candidates.min_by { calculate_distance(i, _1) }
  distance = calculate_distance(i, nearest)

  [[i, nearest].sort, distance]
end.uniq.sort_by { _1[1] }

# begin spaghetti

circuits = []

nearest_neighbours.take(10).each do |(i, j), _|
  connected = []

  circuits.each_with_index do |circuit, index|
    if circuit.include?(i) || circuit.include?(j)
      connected << index
    end
  end

  if connected.empty?
    circuits << [i, j]
  else
    merged = connected.map { circuits[_1] }.flatten(1).uniq
    merged |= [i, j].sort

    connected.sort.reverse.each { circuits.delete_at(_1) }
    circuits << merged
  end
end

# end spaghetti

puts circuits.sort_by(&:size).take(3).map(&:size).reduce(:*)
