max_area = File.readlines("day9/sample.txt", chomp: true)
  .map { _1.split(",").map(&:to_i) }
  .combination(2)
  .map do |p0, p1|
    x0, y0 = p0
    x1, y1 = p1
    x_min, x_max = [x0, x1].minmax
    y_min, y_max = [y0, y1].minmax

    (x_max - x_min + 1) * (y_max - y_min + 1)
  end.max

puts max_area
