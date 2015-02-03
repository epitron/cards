require "./deck"

describe Deck do

  it "has 52 cards" do
    expect(Deck.new.size).to eq(52)
  end

  it "shuffles" do
    deck = Deck.new
    deck.shuffle!

    # Shuffled deck should not be the same as a fresh deck
    expect(deck).not_to eq(Deck.new)

    # A sorted deck should the same as a fresh deck
    expect(deck.sort).to eq(Deck.new)
  end

  it "deals cards" do
    deck = Deck.new

    # Make sure we're playing with a full deck
    expect(deck.size).to eq(52)

    # Deal 2 cards
    cards = deck.deal(2)

    # Were 2 cards removed from the deck?
    expect(cards.size).to eq(2)
    expect(deck.size ).to eq(50)

    # Check that putting back the dealt cards results in a full deck
    expect(deck + cards).to eq(Deck.new)

    # Make sure we can't deal too many cards
    expect { deck.deal 500 }.to raise_error

    cards = deck.deal(52-5)
    expect(cards.size).to eq(52-5)
    expect(deck.size).to eq(0)
    expect(deck).to be_empty

    expect { deck.deal 1 }.to raise_error


  end

end