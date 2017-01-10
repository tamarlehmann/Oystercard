class Oystercard

  attr_reader :balance
  MAX_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(amt)
    raise 'Balance cannot exceed 90' if (balance + amt) > MAX_BALANCE
    @balance += amt
  end

  def deduct(amt)
    @balance -= amt
  end

end
