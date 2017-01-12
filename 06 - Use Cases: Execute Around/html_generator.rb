# def h1
#   "<h1>#{yield}</h1>"
# end
#
# def h2
#   "<h2>#{yield}</h2>"
# end

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