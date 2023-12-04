def read_file(file_path)
  file = File.open(file_path, "r")
  lines = file.readlines.map(&:chomp)
  file.close
  lines
end

def word_to_number(word)
  number_mapping = {
    'zero' => '0',
    'one' => '1',
    'two' => '2',
    'three' => '3',
    'four' => '4',
    'five' => '5',
    'six' => '6',
    'seven' => '7',
    'eight' => '8',
    'nine' => '9'
  }

  number_mapping[word.downcase] || word
end

def find_and_collect_numbers(input)
  words = input.scan(/\b(?:zero|one|two|three|four|five|six|seven|eight|nine|\d+)\b/i)
  numbers_list = []

  words.each do |word|
    number = word_to_number(word)
    numbers_list << number.to_i
  end

  numbers_list
end

file_path = "input.txt"
calibration_document = read_file(file_path)

sum = 0

calibration_document.each do |line|
  puts find_and_collect_numbers(line)
end

puts "Sum of digits is:"
puts sum