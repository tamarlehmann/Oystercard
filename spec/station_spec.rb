require 'station'

describe Station do
  subject(:station) {described_class.new "Bank"}
  subject(:station2) {described_class.new "Aldgate"}

describe '#class_initiation' do
  it 'creates an instance of a station' do
    expect(station).to be_a(Station)
  end

  it 'initialises with a station name' do
    expect(station.name).to eq("Bank")
  end

  it 'raises error if station isnt in stations.csv' do
    message = "Station doesn't exist on the map yet."
    expect { victoai = Station.new("victorai") }.to raise_error message
  end
end

describe '#zone_variable' do
  it 'passes zone to a station when station is created' do
    expect(station.zone).to eq (1)
  end

  it 'finds different zones for different stations' do
    expect(station2.zone).to eq (2)
  end
end

end
