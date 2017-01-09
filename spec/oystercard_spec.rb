require 'oystercard'

describe Oystercard do
  it 'initialises with a balance of 0' do
    card = Oystercard.new
    expect(card.balance).to eq 0
  end

  it 'tops up by a given amount' do
    card = Oystercard.new
    # card.top_up(10)
    expect(card.top_up(10)).to eq card.balance
  end
end
