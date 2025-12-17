devices = {}
cache = Hash.new(0)
File.readlines("day11/sample.txt", chomp: true).each do |line|
  key, value = line.split(": ")
  devices[key] = value.split(" ")
end

def avoid_chernobyl(devices, cache, current_key)
  return if (next_key = devices[current_key]).nil?

  next_key.each do |key|
    cache[key] += 1
    avoid_chernobyl(devices, cache, key)
  end
end

avoid_chernobyl(devices, cache, "you")

puts cache["out"]
