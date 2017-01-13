require_relative 'journey'

class Oystercard

  attr_reader :balance, :journey_log
  MAX_BALANCE = 90


  def initialize
    @balance = 0
    @journey_log = JourneyLog.new
  end

  def top_up(amt)
    raise 'Balance cannot exceed 90' if (balance + amt) > MAX_BALANCE
    @balance += amt
  end

  def touch_in(entry_station)
    raise "Insufficient funds on card. Top up!" if balance < Journey::MIN_FARE
    @journey_log.start(entry_station)
    deduct(@journey_log.journey_fare)
  end

  def touch_out(exit_station)
    @journey_log.finish(exit_station)
    deduct(@journey_log.journey_fare)
    @journey_log.journey_fare = 0
  end

  private

  def deduct(amt)
    @balance -= amt
  end

end
