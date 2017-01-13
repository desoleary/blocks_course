class Canvas
  attr_accessor :width, :height, :color

  def initialize
    @width = 100
    @height = 100
    @color = :green
    yield self if block_given?
  end
end

canvas = Canvas.new do |c|
  c.width = 800
  c.height = 600
end

p canvas # excellent example is configuring a gem

# Managing Resources
class Gateway
  def self.open(user, password)
    gateway = self.new(user, password)
    gateway.connect
    return gateway unless block_given?

    begin
      yield(gateway)
    ensure
      gateway.disconnect
    end
  end
end

Gateway.open('admin', 'secret') do |g|
  # use gateway referenced in ‘g’
end