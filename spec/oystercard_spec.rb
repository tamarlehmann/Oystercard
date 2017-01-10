require 'oystercard'

describe Oystercard do
  subject(:card) { described_class.new}
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

describe '#deduct' do
  it 'checks that card responds to the deduct method' do
    expect(card).to respond_to(:deduct).with(1).argument
  end

  it 'reduces balance by a given amount' do
    expect{card.deduct(10)}.to change{card.balance}.by(-10)
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
      card.touch_in
      expect(card.in_journey?).to be_truthy
  end
end

  describe '#touch_out' do
    it 'checks that the card responds to the touch_out method' do
      expect(card).to respond_to(:touch_out)
    end

    it 'changes in_journey? to false' do
      card.touch_in
      card.touch_out
      expect(card.in_journey?).to be_falsey
  end
end

end
