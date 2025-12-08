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

# ???????????
