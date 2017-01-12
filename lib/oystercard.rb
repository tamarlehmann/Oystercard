require_relative 'journey'

class Oystercard

  attr_reader :balance, :journey_history, :journey
  MAX_BALANCE = 90


  def initialize
    @balance = 0
    @journey_history = []
    @journey = nil
  end

  def top_up(amt)
    raise 'Balance cannot exceed 90' if (balance + amt) > MAX_BALANCE
    @balance += amt
  end

  def touch_in(entry_station)
    raise "Insufficient funds on card. Top up!" if balance < Journey::MIN_FARE
    touch_in_edge_case if !@journey.nil?
    @journey = Journey.new(entry_station)
  end

  def touch_out(exit_station)
    if @journey == nil
      touch_out_edge_case(exit_station)
    else
      @journey_history << @journey.complete_journey(exit_station)
      deduct(@journey.fare)
      @journey = nil
    end
  end

  private

  def deduct(amt)
    @balance -= amt
  end

  def touch_in_edge_case
    @journey_history << @journey.start_journey
    deduct(@journey.fare)
  end

  def touch_out_edge_case(exit_station)
    deduct(Journey::PENALTY_CHARGE)
    @journey_history << { entry: nil, exit: exit_station }
  end

end
