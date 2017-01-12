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
    @entry_station = entry_station
    @full_journey = { entry: @entry_station, exit: @exit_station }
  end

  def complete_journey(exit_station)
    @exit_station = exit_station
    @full_journey = { entry: @entry_station, exit: @exit_station }
  end

  def fare
     (@exit_station != nil && @entry_station != nil) ? MIN_FARE : PENALTY_CHARGE
  end
end
