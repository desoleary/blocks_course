#### Multi-line block ####
1.upto(4) do |number| # start of block
  puts "Echo!#{number}"
end # end of block

#### Single-line block ####
1.upto(4) { |number| puts "Echo!#{number}" }

#### Scoping rules ####

name  = 'Curly'
number = 99
temp   = 32.0

# variables outside the block can be shared inside the block
# TODO: Remove temp; see the result
3.times do |number; temp | # variables outside the block can be shared inside the block e.g. temp
  # block-level variables are reserved for inside the block variables defined inside a block are local to the block
  name = 'Moe'
  age = 25
  temp = 98.6 # because temp is defined as a block variable it will not affect what is outside the block
  puts "#{number}: #{name} is #{age} (#{temp})"
end
# TODO: comment out age, what happens and why?
# puts age
puts name
puts number
puts temp

#### each Iterator ####
Order = Struct.new(:email, :amount, :score)

@orders = [Order.new('joe@example.com', '$10.00', 5),
          Order.new('larry@example.com', '$30.00', 9),
          Order.new('curly@example.com', '$40.00', 12)]

# each implementation
def each
  @orders.each { |item| yield item}
end

# one-by-one each element in the array is assigned to the block paramete
each { |order| puts order.email }

#### select Iterator ####
scores = [ 85, 105, 71, 113, 122, 94]
puts high_scores = scores.select { |score| score > 100 }
# returns an array containing all elements for which the block is true

# select implementation
def my_select
  new_array = []
  each do |value|
    new_array << value if yield(value)
  end
  new_array
end

puts my_select{|order| order.email =~ /joe/}

#### reject Iterator ####

p low_scores = scores.reject { |score| score > 100 }

def my_reject
  new_array = []
  each do |value|
    new_array << value unless yield(value)
  end
  new_array
end

puts my_reject{|order| order.email =~ /joe/}

#### any? ####

puts high_scores = scores.any? { |score| score > 100 }

def my_any?
  new_array = []
  each do |value|
    new_array << value; break if yield(value)
  end
  !new_array.empty?
end

my_any?{|order| order.amount == '$10.00'}


#### detect ####

puts first_high_scores = scores.detect { |score| score > 100 }

def my_detect
  each do |value|
    return value if yield(value)
  end
  nil
end

puts my_detect{|order| order.email =~ /example/}

#### partition ####
high, low = scores.partition { |score| score > 100 }

#### map ####
doubled = scores.map { |score| score * 2}

def my_map
  new_array = []
  each do |value|
    new_array << yield(value)
  end
  new_array
end

puts my_map {|order|order.amount}


#### reduce ####

total = scores.reduce(0) { |sum, score| sum + score }

def my_reduce(initial_value)
  sum = initial_value
  each do |value|
    sum = yield(sum, value)
  end
  sum
end

puts my_reduce(0) {|sum, order| sum + order.score}


#### yeilding ####

def roll
  number = rand(1..6)
  result = yield('Larry', number) # variable that captures the value of yield returned from the block
  puts "The block returned #{result}."
end

roll do |name, number| # yield params passed on to the yield operator
  puts "#{name} rolled a #{number}!"
  number * 10 # this will be the result of yielding
end