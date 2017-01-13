require_relative 'journey'
require_relative 'oystercard'

class JourneyLog

  attr_accessor :journey_class, :journey_fare
  attr_reader :journeys

  def initialize
    @journey_class = nil
    @journeys = []
    @journey_fare = 0
  end

  def start(entry_station)
    current_journey(entry_station) if @journey_class != nil
    @journey_class = Journey.new(entry_station)
  end

  def finish(exit_station)
    no_touch_in(exit_station) if @journey_class == nil
    @journey_class.complete_journey(exit_station) if  @journey_class != nil
    @journeys.push(@journey_class.full_journey) if @journey_class != nil
    fare
    @journey_class = nil
  end

  def no_touch_in(exit_station)
    @journeys.push({ entry: nil, exit: exit_station })
  end

  def fare
    if @journey_class != nil
      @journey_fare = @journey_class.fare
    else
      @journey_fare = Journey::PENALTY_CHARGE
    end
  end

private

  def current_journey(entry_station)
    @journeys.push(@journey_class.full_journey)
    fare if @journey_class != nil
    @journey_class = Journey.new(entry_station)
  end

  def no_touch_in(exit_station)
    @journeys.push({ entry: nil, exit: exit_station })
  end
end
