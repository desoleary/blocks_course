def three_times
  1.upto(3) do |count|
    yield count
  end
end

three_times {puts 'Ho!'}

three_times do |number|
  puts "#{number} situp"
  puts "#{number} pushup"
  puts "#{number} chinup"
end

def deal
  faces = %w(Jack Queen King Ace)
  suits = %w(Hearts Diamonds Spades Clubs)

  if block_given?
    random_face = faces.sample
    random_suit = suits.sample
    score       = yield random_face, random_suit
    puts "You scored a #{score}!"
  else
    puts 'No deal!'
  end
end

deal { |face, suit| face.length + suit.length}

deal

def n_times(number)
  1.upto(number) do |count|
    yield count
  end
end

n_times(5) do |number|
  puts "#{number} situp"
  puts "#{number} pushup"
  puts "#{number} chinup"
end

def deal(number_of_cards)
  faces = %w(Jack Queen King Ace)
  suits = %w(Hearts Diamonds Spades Clubs)

  if block_given?
    number_of_cards.times do
      random_face = faces.sample
      random_suit = suits.sample
      score       = yield random_face, random_suit
      puts "You scored a #{score}!"
    end
  else
    puts 'No deal!'
  end
end

deal(10) do |face, suit|
  puts "Dealt a #{face} of #{suit}"
  face.length + suit.length
end

def progress
  0.step(by: 10, to: 100) do |number|
    yield number
  end
end

progress { |percent| puts percent }