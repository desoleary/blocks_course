# Suppose you wanted to continue doing five repetitions of each exercise,
# but counting by 2, starting with 1 and ending with 9.
1.step(9, 2) do |count|
  puts "#{count} situp"
  puts "#{count} pushup"
  puts "#{count} chinup"
end