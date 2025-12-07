BEAM = "S".freeze
SPLITTER = "^".freeze
OPEN = ".".freeze
previous_window = nil
count = 0

File.readlines("day7/sample.txt", chomp: true).each do |line|
  current_window = line.chars

  if previous_window.nil?
    previous_window = current_window

    next
  end

  previous_window.each_with_index do |previous_char, index|
    next unless previous_char == BEAM

    case current_window[index]
    when OPEN
      current_window[index] = BEAM
    when SPLITTER
      [-1, 1].each do |offset|
        adjacent = index + offset
        current_window[adjacent] = BEAM if current_window[adjacent] != SPLITTER
      end

      count += 1
    end
  end

  previous_window = current_window
end

puts count
