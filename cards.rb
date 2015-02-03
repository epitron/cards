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

class Hand < Array

  def initialize(cards)
    super cards
  end

end

class OutOfCardsError < Exception; end

class Deck < Array

  def initialize
    super (Card.first..Card.last).to_a
  end

  def shuffle; shuffle!; end

  def deal(n)
    raise OutOfCardsError unless size >= n
    pop(n)
  end

end



class PokerHand < Hand

  def hand_size; 5; end

  def initialize(deck)
    deck.take(size)
  end

  def size
    5
  end

  def highest
    cards.sort.last
  end

  def lowest
    cards.sort.first
  end

  def pairs
    groups_of(2)
  end
  def one_pair?
    pairs.size == 1
  end

  def two_pair?
    pairs.size == 2
  end

  def groups_of(n, on=:value)
    cards.group_by(&on).select { |k,v| v.size == n }
  end

  def triples
    groups_of(3)
  end

  def triple?
    triples.size == 1
  end

  def full_house?
    triple? and one_pair?
  end

  def flush?
    all?
  end

  def straight?
    cards.sort_by(&:value).each_cons(2) { |a,b| (a.value + 1) == b.value }
  end

  def flush?
    groups_of(5, :suit).size == 1
  end

  def straight_flush?
    straight? and flush?
  end

  def four_of_a_kind?
    groups_of(4).size == 1
  end

  def royal?
    cards.all? { |card| card.value > 10 }
  end

  def royal_flush?
    flush? and lowest.value == 10
  end

  # HAND_ORDER = [:highest_card?,
  #   :pair?,
  #   :two_pair?, :triple?, :straight?, :full_house?,
  #   :flush, [:straight, :flush],
  #   :four_of_a_kind, [:royal, :flush]


  include Comparable
  def <=>(other)

  end

end


class Player
end

class Game

  def start
  end

end

# SUITS = %w[Clubs Diamonds Hearts Spades]
# FACES = %w[Jack Queen King Ace]
# DECK = %w[
#   🂡 🂱 🃁 🃑
#   🂢 🂲 🃂 🃒
#   🂣 🂳 🃃 🃓
#   🂤 🂴 🃄 🃔
#   🂥 🂵 🃅 🃕
#   🂦 🂶 🃆 🃖
#   🂧 🂷 🃇 🃗
#   🂨 🂸 🃈 🃘
#   🂩 🂹 🃉 🃙
#   🂪 🂺 🃊 🃚
#   🂫 🂻 🃋 🃛
#   🂬 🂼 🃌 🃜
#   🂭 🂽 🃍 🃝
#   🂮 🂾 🃎 🃞
# ]
deck = Deck.new
# p deck.size
p deck
p deck.shuffle

