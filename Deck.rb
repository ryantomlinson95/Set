require './Card'

# This class initializes the deck of 81 unique cards. 
# Includes methods for shuffling, deleting and getting the size of the deck
# Requires 'Card' class for building an individual card
class Deck

  # initialize: Creates a new instance of Deck which holds
  #             81 cards for the game. 
  #
  # @cards - Instance variable for cards array
  # 
  # Example: 
  #
  #   deck = Deck.new
  #   # => deck is now an array of 81 "Card" objects from
  #        the Card class in Card.rb
  #
  # Returns the deck as an array of Cards
  def initialize
    @cards = []
    for shape in 1..3 do
      for color in 1..3 do
	      for number in 1..3 do
	        for shading in 1..3 do
            @cards << Card.new([shape, color, number, shading])
          end
        end
      end
    end
  end

  # draw: Removes one card from the top of the deck and
  #       returns it.
  #
  # Returns the top card from the deck.
  def draw
    return @cards.delete_at(0)
  end

  # shuffle: Randomizes the order of the @cards instance variable
  #
  # Returns the shuffled array of cards
  def shuffle
    @cards = @cards.shuffle
  end

  # size: Retrieves the length of the instance variable @cards
  #
  # Returns the length of the cards array 
  def size
    return @cards.length
  end

end
