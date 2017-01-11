require 'csv'

class Station
  attr_reader :zone, :name

  def initialize(name)
    @name = name
    load_stations
    raise "Station doesn't exist on the map yet." if !@catalog.has_key?(@name)
    @zone = @catalog[@name]
  end

  def load_stations(filename = 'stations.csv')
    @catalog = Hash.new
    CSV.foreach(filename) do |line|
      name = line[0]
      zone = line[1]
      @catalog.store(name,zone.to_i)
  end
end
end
