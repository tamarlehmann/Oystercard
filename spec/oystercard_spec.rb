require 'oystercard'

describe Oystercard do
  subject(:card) { described_class.new}
  let(:station) {double :station}

  it 'initialises with a balance of 0' do
    expect(card.balance).to eq 0
  end

  it 'initialises with an entry station of nil' do
    expect(card.entry_station).to be_falsey
  end

describe '#top_up' do
  it 'tops up by a given amount' do
    expect(card.top_up(10)).to eq card.balance
  end

  it 'throws error if balance exceeds 90' do
    expect{ card.top_up(91) }.to raise_error("Balance cannot exceed #{Oystercard::MAX_BALANCE}")
  end
end

describe '#in_journey?' do
  it 'checks whether the card is in use or not' do
    expect(card.in_journey?).to be_falsey
  end
end

  describe '#touch_in' do
    it 'checks that the card responds to the touch_in method' do
      expect(card).to respond_to(:touch_in)
  end

    it 'changes in_journey? to true' do
      card.top_up(Oystercard::MIN_FARE)
      card.touch_in(station)
      expect(card.in_journey?).to be_truthy
  end

  it 'raises an error if insufficient balance on card' do
    expect{card.touch_in(station)}.to raise_error("Insufficient funds on card. Top up!")
  end

  it 'remembers entry station after touch_in' do
    card.top_up(Oystercard::MIN_FARE)
    card.touch_in(station)
    expect(card.entry_station).to eq(station)
  end

end

  describe '#touch_out' do
    it 'checks that the card responds to the touch_out method' do
      expect(card).to respond_to(:touch_out)
    end

    it 'changes in_journey? to false' do
      card.top_up(Oystercard::MIN_FARE)
      card.touch_in(station)
      card.touch_out
      expect(card.in_journey?).to be_falsey
  end

    it 'deducts the MIN_FARE when we touch out' do
      card.top_up(Oystercard::MIN_FARE)
      card.touch_in(station)
      expect{card.touch_out}.to change{card.balance}.by(-Oystercard::MIN_FARE)
    end

    it 'forgets the entry station when touching out' do
      card.top_up(Oystercard::MIN_FARE)
      card.touch_in(station)
      card.touch_out
      expect(card.entry_station).to eq nil
    end
end

end
