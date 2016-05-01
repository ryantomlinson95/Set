require 'colorize'

# This class requires the gem 'colorize'
# This class makes an individual card with properties:
#   shape, number of shapes, color and shading
# 
# The characteristics are defined as follows:
#
#    First Element = Shape
#        1->Diamond
#        2->Oval
#        3->Square
#    Second Element = Number
#        1->1
#        2->2
#        3->3
#    Third Element = Color
#        1->Red
#        2->Blue
#        3->Green
#    Fourth Element = Shading
#        1->Shaded
#        2->Empty
#        3->Striped
class Card
  
  # get_code: Creates a shallow copy of @card instance
  #           but does not copy the reference
  #
  # Returns a copy of the card
  def get_code
    @card.clone
  end

  # initialize: Creates a new instance of Card that 
  #	        that sets the Card properties based 
  #		on the array of properties input
  #
  # properties - The desired properties for the card
  #
  # Example:
  #  
  #   card1 = Card.new [1,2,2,3]
  #   # => A card with 2 striped red diamonds
  #
  # Returns a card with the desired properties  
  def initialize(properties)
    @card = properties
  end
  
end
