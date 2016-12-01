class Order
  TAX_TABLE = {'CO' => 0.02, 'MT' => 0.00, 'AZ' => 0.04}
  attr_reader :email, :total, :state, :status

  def initialize(email, state, total, status=:pending)
    @email  = email
    @total  = total
    @state  = state
    @status = status
  end

  def tax
    total * TAX_TABLE[state]
  end

  def to_s
    "#{email} (#{state}): $#{total} - #{status}"
  end
end