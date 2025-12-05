sections = File.read("day5/sample.txt", chomp: true).split(/\n\n+/)
ranges = sections[0].lines.flat_map do |line|
  min, max = line.split("-").map(&:to_i).sort

  [[min, :start], [max, :end]]
end.sort_by { |point, type| [point, type == :start ? 0 : 1] }
points = sections[1].lines.map(&:strip)
unions = []
open_intervals = 0
x0 = nil

ranges.each do |x, type|
  if type == :start
    open_intervals += 1
    x0 ||= x
  else
    open_intervals -= 1

    if open_intervals.zero?
      unions << (x0..x)
      x0 = nil
    end
  end
end

count = points.count do |point|
  unions.any? { _1.cover?(point.to_i) }
end

puts count
