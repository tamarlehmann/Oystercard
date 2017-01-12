class Journey

  attr_reader :entry_station, :exit_station, :full_journey

    MIN_FARE = 1
    PENALTY_CHARGE = 6

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @exit_station = nil
    start_journey
  end

  def in_journey?
    @entry_station != nil
  end

  def start_journey
    @full_journey = { entry: @entry_station, exit: @exit_station }

  end

  def complete_journey(exit_station)
    @exit_station = exit_station
    @full_journey = { entry: @entry_station, exit: @exit_station }
  end

  def fare
    if @exit_station == nil
      PENALTY_CHARGE
    else
      MIN_FARE
    end

  end
end
