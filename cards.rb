class Card
  attr_reader :pos

  # Constants
  SUITS = %w[♠ ♥ ♦ ♣]
  NUMS  = [*2..10]
  FACES = %w[J Q K A]

  DECK  = (NUMS + FACES).map{ |val| SUITS.map{ |suit| [val, suit] } }.flatten(1)

  def initialize(pos=0)
    @pos = pos
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
    "#{DECK[pos].join}"
  end
end


# Create a 5 deck shoe...
p (Card.all * 5).shuffle



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

