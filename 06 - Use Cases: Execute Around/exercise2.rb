# puts "Got Here!"
#
# magic_number = (23 - Time.now.hour) * Math::PI
#
# puts "Result was #{result}"

# NOTE: Above replaced with_debugging method

def with_debugging
  puts 'Got Here!'
  result = yield
  puts "Result was #{result}"
end

def with_expectation(expected)
  puts 'Running test...'
  actual = yield
  if expected == actual
    puts 'Passed.'
  else
    puts 'Failed!'
    puts "Expected #{expected}, but got #{actual}."
  end
end

with_debugging do
  magic_number = (23 - Time.now.hour) * Math::PI
end

with_expectation(4) { 2 + 2 }
with_expectation(5) { 2 + 2 }

require 'benchmark'

def time_it(label)
  elapsed_time = Benchmark.realtime do
    yield
  end
  puts "#{label} took #{elapsed_time}"
end

time_it("Sleepy code") do
  # run some code
  sleep(1)
end
