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

