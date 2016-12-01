class Order
  attr_reader :email, :total

  def initialize(email, total)
    @email = email
    @total = total
  end

  def to_s
    "#{email}: $#{total}"
  end
end

orders = []
1.upto(5) {|n|orders << Order.new("customer#{n}@example.com", n * 10)}
puts orders