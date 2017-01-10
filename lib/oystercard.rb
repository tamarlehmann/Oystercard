class Oystercard

  attr_reader :balance, :in_journey
  MAX_BALANCE = 90
  MIN_FARE = 1

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

  def in_journey?
    @in_journey == true
  end

  def touch_in
    raise "Insufficient funds on card. Top up!" if balance < MIN_FARE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

end
