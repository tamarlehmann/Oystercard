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
end
