require_relative 'journey'

class JourneyLog

  attr_reader :journey_class, :journeys

  def initialize
    @journey_class = nil
    @journeys = []
  end

  def start(entry_station)
    current_journey(entry_station) if @journey_class != nil
    @journey_class = Journey.new(entry_station)
  end

  def finish(exit_station)
    
  end

private

  def current_journey(entry_station)
    @journeys.push(@journey_class.full_journey)
    @journey_class = Journey.new(entry_station)
  end

end
