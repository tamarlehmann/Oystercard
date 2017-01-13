require 'oystercard'

describe Oystercard do
  subject(:card) { described_class.new}
  let(:station) {double :station}
  let(:station2) {double :station}
  let(:journey) {double :journey}

  it 'initialises with a balance of 0' do
    expect(card.balance).to eq 0
  end

describe '#top_up' do
  it 'tops up by a given amount' do
    expect(card.top_up(10)).to eq card.balance
  end

  it 'throws error if balance exceeds 90' do
    expect{ card.top_up(91) }.to raise_error("Balance cannot exceed #{Oystercard::MAX_BALANCE}")
  end
end

  describe '#touch_in' do
    it 'checks that the card responds to the touch_in method' do
      expect(card).to respond_to(:touch_in)
  end

  it 'raises an error if insufficient balance on card' do
    expect{card.touch_in(station)}.to raise_error("Insufficient funds on card. Top up!")
  end

  it 'deducts the penalty fare when touching in without touching out' do
    card.top_up(Journey::PENALTY_CHARGE)
    card.touch_in(station)
    expect{ card.touch_in(station) }.to change{card.balance}.by(-Journey::PENALTY_CHARGE)
  end

end

  describe '#touch_out' do
    it 'checks that the card responds to the touch_out method' do
      expect(card).to respond_to(:touch_out)
    end

    it 'deducts the MIN_FARE when we touch out' do
      card.top_up(Journey::MIN_FARE)
      card.touch_in(station)
      expect{card.touch_out(station2)}.to change{card.balance}.by(-Journey::MIN_FARE)
    end

    it 'deducts the penalty fare when touching out without touching in' do
      card.top_up(Journey::PENALTY_CHARGE)
      expect{ card.touch_out(station) }.to change{card.balance}.by(-Journey::PENALTY_CHARGE)
    end
  end
end
