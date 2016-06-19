puts 'The Secret Number is between 0 to 10 (inclusive)'
secret_number = rand(11)
guess = -1

while guess != secret_number
  guess = gets.to_i
  puts 'Incorrect! Your guess is too low' if guess < secret_number
  puts 'Incorrect! Your guess is too high' if (guess > secret_number)
end

puts 'Correct!'
