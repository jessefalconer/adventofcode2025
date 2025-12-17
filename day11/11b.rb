devices = {}
cache = Hash.new(0)
File.readlines("day11/sample2.txt", chomp: true).each do |line|
  key, value = line.split(": ")
  devices[key] = value.split(" ")
end

def avoid_chernobyl(devices, node, fft, dac, cache)
  current = [node, fft, dac]

  return cache[current] if cache.key?(current)
  return cache[current] = 1 if fft && dac && node == "out"
  return cache[current] if devices[node].nil?

  total = 0

  devices[node].each do |next_node|
    result = avoid_chernobyl(
      devices,
      next_node,
      fft || next_node == "fft",
      dac || next_node == "dac",
      cache
    )

    total += result
  end

  cache[current] = total
end

puts avoid_chernobyl(devices, "svr", false, false, cache)
