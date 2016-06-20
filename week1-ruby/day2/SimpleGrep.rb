# Write a simple grep that will print the lines of a file having any
# occurrences of a phrase anywhere in that line. You will need to do
# a simple regular expression match and read lines from a file. (This
# is surprisingly simple in Ruby.) If you want, include line numbers.

puts "Enter the filename you would like to search"
filename = gets.chomp

puts "Enter the phrase you would like to search for"
phrase = gets.chomp

File.open(filename, 'r').each { |line| puts line if line =~ Regexp.new(phrase) }
