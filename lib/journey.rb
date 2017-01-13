class Journey

  attr_reader :entry_station, :exit_station, :full_journey, :fare, :entry_zone, :exit_zone

    MIN_FARE = 1
    PENALTY_CHARGE = 6

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @exit_station = nil
    @entry_zone = nil
    @exit_zone = nil
    start_journey
  end

  def in_journey?
    @entry_station != nil
  end

  def start_journey
    @entry_station = entry_station
    @entry_zone = entry_station.zone
    @full_journey = { entry: @entry_station, exit: @exit_station }
  end

  def complete_journey(exit_station)
    @exit_station = exit_station
    @exit_zone = exit_station.zone
    @full_journey = { entry: @entry_station, exit: @exit_station }
  end

  def fare
     (@exit_station != nil && @entry_station != nil) ? MIN_FARE + zone_calc : PENALTY_CHARGE
  end

private

def zone_calc
  (@entry_zone - @exit_zone).abs
end

end
