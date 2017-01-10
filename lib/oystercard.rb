class Oystercard

  attr_reader :balance, :entry_station, :journey_history
  MAX_BALANCE = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @journey_history = []
  end

  def top_up(amt)
    raise 'Balance cannot exceed 90' if (balance + amt) > MAX_BALANCE
    @balance += amt
  end

  def in_journey?
    @entry_station != nil
  end

  def touch_in(station)
    raise "Insufficient funds on card. Top up!" if balance < MIN_FARE
    @entry_station = station
  end

  def touch_out(station)
    hash = { entry_station: @entry_station, exit_station: (station) }
    @journey_history.push(hash)
    deduct(MIN_FARE)
    @entry_station = nil
  end

  private

  def deduct(amt)
    @balance -= amt
  end


end
