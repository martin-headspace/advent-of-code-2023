def read_file(file_path)
    file = File.open(file_path, "r")
    lines = file.readlines.map(&:chomp)
    file.close
    lines
  end

  def concatenate_first_and_last_digits(str)
    digits = str.scan(/\d/)
    first_digit = digits.first || "0"
    last_digit = digits.last || "0"
    concatenated_number = (first_digit + last_digit).to_i
    concatenated_number
end
  
file_path = "input.txt"
calibration_document = read_file(file_path)

sum = 0

calibration_document.each do |line|
    sum += concatenate_first_and_last_digits(line)
end

puts "Sum of digits is:"
puts sum