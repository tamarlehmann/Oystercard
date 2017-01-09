require 'oystercard'

describe Oystercard do
  it 'initialises with a balance of 0' do
    card = Oystercard.new
    expect(card.balance).to eq 0
  end


end
