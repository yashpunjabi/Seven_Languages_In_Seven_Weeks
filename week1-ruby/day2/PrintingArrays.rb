# Print the contents of an array of sixteen numbers, four numbers
# at a time, using just each

array = (0..15).to_a

count = 0
array.each do |x|
    print "#{x}, "
    count += 1
    puts if count % 4 == 0
end

puts

# Now, do the same with each_slice in Enumerable

array.each_slice(4) { |slice| puts slice.join(', ') }
