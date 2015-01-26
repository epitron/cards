require 'epitools'

class Card

  include Comparable

  attr_reader :pos

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

  SUITS = %w[♠ ♥ ♦ ♣]
  NUMS  = [*2..10]
  FACES = %w[J Q K A]
  
  DECK = (NUMS + FACES) * SUITS

  def <=>(other)
    pos <=> other.pos
  end

  def self.first
    Card.new(0)
  end

  def self.last
    Card.new(DECK.size-1)
  end

  def self.deck
    (Card.first..Card.last).to_a
  end

  def initialize(pos=0)
    @pos = pos
  end

  def succ
    Card.new(@pos + 1)
  end

  def inspect
    "#{DECK[@pos]}"
  end
end

