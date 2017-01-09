require 'oystercard'

describe Oystercard do
  it 'initialises with a balance of 0' do
    #card = Oystercard.new
    expect(subject.balance).to eq 0
  end

  it 'tops up by a given amount' do
    card = Oystercard.new
    # card.top_up(10)
    expect(card.top_up(10)).to eq card.balance
  end

<<<<<<< HEAD
  it 'throws error if balance exceeds 90' do
    card = Oystercard.new
    maximum_bal = Oystercard::MAX_BALANCE
    expect{ card.top_up(91) }.to raise_error("Balance cannot exceed #{maximum_bal}")
=======
  it 'tops up by a given amount' do
    card = Oystercard.new
    # card.top_up(10)
    expect(card.top_up(10)).to eq card.balance
  end

  it 'throws error if balance exceeds 90' do
    card = Oystercard.new
    expect{ card.top_up(91) }.to raise_error("Balance cannot exceed 90")
>>>>>>> 4ad3e6c3d66d6fa9fe49917fd53a452b13065e5e
  end

end
