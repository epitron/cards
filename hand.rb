require './deck'
require './card'

class Hand < Array

  def initialize(cards)
    super cards
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
