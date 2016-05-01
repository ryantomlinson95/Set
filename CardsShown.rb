# This class initializes the array of the face up cards. 
# Includes methods for drawing 3 more cards, getting the size
# of the cards shown array, getting and deleting cards at a given
# position.
class CardsShown

  # initialize: Creates a new instance of CardsShown 
  #
  # deck - The deck that the cards are being drawn from
  #
  # Example:
  #
  #   cardsShown = CardsShown.new(deck)
  #   # => An array of 12 @Cards
  #
  # Returns the face up cards
  def initialize(deck)
    @cardsShown=[]
    for i in 1..12
      @cardsShown << deck.draw
    end
  end

  # draw3more: Removes 3 cards from the deck
  #            and adds them to the face up cards 
  #
  # deck - The deck that the cards are being drawn from
  #
  # Adds 3 more cards to cardsShown
  def draw3more(deck)
    for i in 1..3
      @cardsShown << deck.draw
    end
  end

  # size: Retrieves and returns how many cards are face up
  #
  # Example:
  #
  #   cardsShown.size
  #   # => N where 'N' is the number of face up cards
  #
  # Returns the face up cards
  def size
    return @cardsShown.length
  end

  # getCard: Retrieves the card at a given position in cardsShown
  #
  # pos - The position of the card to be retrieved
  #
  # Example:
  #
  #   cardsShown.getCard(pos)
  #   # => [a,b,c,d] where 'a','b','c', and 'd' are
  #        the characteristics of the card at position 'pos'
  #
  # Returns the card at the given position
  def getCard(pos)
    @cardsShown[pos].get_code
  end

  # deleteCard: Deletes the card at a given position in cardsShown
  #
  # pos - The position of the card to be deleted
  #
  # Removes a card from the cardsShown array
  def deleteCard(pos)
    @cardsShown.delete_at(pos)
  end

end
