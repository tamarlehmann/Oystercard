require 'journey'

describe Journey do
  let (:journey) { described_class.new("bank")}
  # let(:station) {double :station}
  # let(:station2) {double :station}

  describe '#in_journey?' do

    it 'test if in journey' do
    expect(journey).to be_in_journey
    end

    it ' initialises with an entry station set to bank ' do
      expect(journey.entry_station).to eq 'bank'
    end

    it ' initialises with an exit station set to nil ' do
      expect(journey.exit_station).to eq nil
    end

    it 'full journey is stred with a nil exit station' do
      expect(journey.full_journey[exit]).to eq nil
    end

  end

    describe '#complete_journey' do
      it 'exit station updates with a station' do
        journey.complete_journey("aldgate")
        expect(journey.exit_station).to eq "aldgate"
      end

    end

end
