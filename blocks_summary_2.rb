#### custom iterators ####

class MovieQueue
  include Enumerable

  def initialize(name)
    @name = name
    @movies = []
  end

  def add_movie(movie)
    @movies << movie
  end

  def each
    @movies.each { |movie| yield movie }
  end
end

Movie = Struct.new(:name, :rating, :duration, :notes)
queue = MovieQueue.new('Best of')

queue.add_movie(Movie.new('Lord of the ring', 'PG', 180, 'too long for most adults'))
queue.add_movie(Movie.new('V for Vendetta', 'M', 120, 'oh yeah'))

result = queue.select do |m|
  m.duration > 150
end

puts result

#### Execute Around ####

def in_airplane_mode
  @airplane_mode = true
  yield
rescue Exception => e
  puts e.message
ensure
  @airplane_mode = false
end

in_airplane_mode {puts "in airplane mode: #{@airplane_mode}"}
puts "out of airplane mode: #{@airplane_mode}"

# works with code generation too

# Above replaced with generic tag method
def tag(tag)
  "<#{tag}>#{yield}</#{tag}>"
end

p tag(:h1) {'Breaking News!'}

p tag(:h2) { "Massive Ruby Discovered" }

result = tag(:ul) do
  tag(:li) { "It sparkles!"}
  tag(:li) { "It shines!"}
  tag(:li) { "It mesmerizes!"}
end
p result