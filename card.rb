require 'paint'

# http://www.pokerstars.com/pages/poker/hand-rankings/

class Card
  attr_reader :pos

  # Constants
  SUITS = %w[♠ ♥ ♦ ♣]
  NUMS  = [*2..14]
  FACES = {11=>"J", 12=>"Q", 13=>"K", 14=>"A"}

  DECK  = NUMS.product(SUITS)

  def initialize(pos=0)
    @pos = pos
  end

  def value
    DECK[pos].first
  end

  def face
    if (2..10).include? value
      value
    else
      FACES[value]
    end
  end

  def suit
    DECK[pos].last
  end

  SUIT_COLORS = {"♠" => :black, "♥" => :red, "♦" => :red, "♣" => :black}

  def color
    SUIT_COLORS[suit]
  end


  # Class methods
  def self.first
    Card.new(0)
  end

  def self.last
    Card.new(DECK.size-1)
  end

  def self.all
    (Card.first..Card.last).to_a
  end


  # Instance methods
  include Comparable

  def <=>(other)
    pos <=> other.pos
  end

  def succ
    Card.new(pos + 1)
  end

  def inspect
    Paint[" #{face} #{suit} ", color, :white]
  end

  def king?
    value == 13
  end

  def queen?
    value == 12
  end

  def jack?
    value == 11
  end

  def ace?
    value == 1
  end

end
