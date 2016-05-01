require './Deck'
require './CardsShown'
require 'timeout'

# Authors: Ryan Tomlinson, Crystal Ceballos, 
#          Tammy Joseph, Ziming Gong


# checkSet: Checks to see if a set of 3 cards qualifies as a "SET".
# 
# card1 - The first Card object to be checked.
# card2 - The second Card object to be checked.
# card3 - The third Card object to be checked.
#
# Example:
#
#
#  checkSet(card1, card2, card3) 
#  # => True if the cards make a set
#  # => False if the cards do not make a set
#
# Returns a boolean declaring if the cards make a set.
def checkSet(card1, card2, card3)
  # Checks if all the cards traits are all the same or all different
  if (shapeSum = (card1[0] + card2[0] + card3[0]) % 3) == 0
    if (numSum = (card1[1] + card2[1] + card3[1]) % 3) == 0
      if (colorSum = (card1[2] + card2[2] + card3[2]) % 3) == 0
        if(shadeSum = (card1[3] + card2[3] + card3[3]) % 3)  == 0
          # If all traits are either all different or all the same => true
          # else => false
	  return true 
	end
      end
    end
  end
  return false
end



# checkCardsShown: Checks to see if the cards laid face up contain a set
#
# cardsShown - The array of cards to be checked
#
# Example:
#  
#  checkCardsShown(cardsShown)
#  # => An array of size "n" where n is the number of sets possible
#       in the face up cards
#
# Returns an answer key for the face up cards
def checkCardsShown(cardsShown)
  answerKey = []
  # Call the checkSet method on every iteration of sets of 3 cards
  # Adds them to answerKey array
  for i in 0..cardsShown.size - 3
    for j in i+1..cardsShown.size - 2
      for k in j+1..cardsShown.size - 1	
	if checkSet(cardsShown.getCard(i), cardsShown.getCard(j), cardsShown.getCard(k))
	   answerKey << [i+1,j+1,k+1]
	end
      end
    end
  end
  answerKey
end



# displayCard: Displays a given card to the user with respects to Shape, Color,
#              Quantity, and Shading.
#
# card - The card to be displayed to the user
#
# Example:
#
#  display(card)
#  # => <*><*> 
#  Assuming the card has two colored in diamonds. (text color omitted)
#
# Displays the given card
def displayCard(card)
  shading = ""
  # Set shading based on shading element
  if card[3] == 1
    shading = "*"
  elsif card[3] == 2
    shading = " "
  elsif card[3] == 3
    shading = "-"
  end

  # Print shape the correct number of times based on number element
  card[1].times do

    # Change color of card based on color element
    if card[2] == 1

      # Print a shape based on shape element
      if card[0] == 1
	print "<#{shading}>".red
      elsif card[0] == 2
	print "(#{shading})".red
      elsif card[0] == 3
	print "[#{shading}]".red
      end

    # Color
    elsif card[2] == 2
      
      # Shape
      if card[0] == 1
	print "<#{shading}>".blue
      elsif card[0] == 2
	print "(#{shading})".blue
      elsif card[0] == 3
	print "[#{shading}]".blue
      end

    # Color
    elsif card[2] == 3

      # Shape
      if card[0] == 1
	print "<#{shading}>".green
      elsif card[0] == 2
	print "(#{shading})".green
      elsif card[0] == 3
	print "[#{shading}]".green
      end
    end
  end # End for number element "do-end"

  # Algorithm to calculate how many spaces to add between cards
  # based on the size of the printed card
  addSpaces = 9 - ((card[1] * 2) + (shading.size * card[1]))
  addSpaces.times do
    print " "
  end
end




# Main program which is also the game loop
# 
# This is where all the user input is handled
# and where the game is executed.
#
gameLoop = true # Initialize the game loop boolean to true

while gameLoop
  
  # Clear the command line for readability
  # and output a game header
  system "clear"
  print("<S>".red + "(E)".blue + "[T]".green)
  puts " "
  puts " "
  
  # Asks user if they want to read the rules
  # Opens a text editor (linux-only) if the say yes
  puts "Would you like to read the rules? (y/n)"
  if gets.chomp == "y"
    system "gedit rules.md&" # "&" makes it run in background
  end #end if
  system "clear"

  # Initializes the deck of cards
  # and shuffles it
  deck = Deck.new
  deck.shuffle

  # Initializes the set of 12 cards
  # to be placed face up
  cardsShown = CardsShown.new(deck)

  # Game header
  system "clear"
  print("<S>".red + "(E)".blue + "[T]".green)
  puts " "
  puts " "

  # Initialize computer difficulty wait time
  puts "Choose a difficulty level then press enter"
  puts "0 = Solo Play"
  puts "1 = Easy"
  puts "2 = Medium"
  puts "3 = Hard"
  puts " "
  difficulty = gets.to_i
  
  if difficulty == 1
    difficultyWaitTime = 90
  elsif difficulty == 2
    difficultyWaitTime = 30
  elsif difficulty == 3
    difficultyWaitTime = 15
  elsif difficulty == 0
    difficultyWaitTime = 0
  end #end if
 
  # Start the main loop that interacts with the user
  # and displays the cards
  setLoop = true
  
  # Initialize player and computer scores
  playerScore = 0
  computerScore = 0
  while setLoop
    system "clear"
    print("<S>".red + "(E)".blue + "[T]".green)
    puts " "
    puts " "
    
    # Displays the first 4 cards as long
    # as there are enough in the deck
    for i in 0...4
      if i < cardsShown.size
        print i+1
        displayCard(cardsShown.getCard(i))
        print "     "
      end #end if
    end #end for
    puts " "

    # Displays the next 4 cards as long
    # as there are enough in the deck
    for i in 4...8
      if i < cardsShown.size
        print i+1
        displayCard(cardsShown.getCard(i))
        print "     "
      end #end if
    end #end for
    puts " "

    # Displays the next 4 cards as long 
    # as there are enough in the deck
    for i in 8...12
      if i < cardsShown.size
        print i+1
        displayCard(cardsShown.getCard(i))
        print "    "
      end #end if
    end #end for
    puts " "

    # Displays 3 more cards if there are
    # no sets in the 12 face up cards     
    if cardsShown.size == 15
      
      for i in 12...cardsShown.size
        print i+1
	displayCard(cardsShown.getCard(i))
	print "   "
      end #end for
      puts " "
    end #end if
   
    # Displays the number of cards left in the deck
    puts "There are #{deck.size} cards left in the deck."

    # Initializes and fills the answer key based on 
    # the twelve (or 15) face up cards
    answerKey = []
    answerKey = checkCardsShown(cardsShown)
    puts " "


    # Set boolean so computer and user
    # don't both find a set
    setFound = false

    # Asks the user if they can see a set
    puts "Is there a set? (y/n)"
    begin 
      # This is where the computer timer begins, if the difficulty
      # time limit is exceeded, a timeout error is caught meaning
      # the computer won.
      Timeout::timeout(difficultyWaitTime) do
        # If the user answers yes, then it 
        # asks them which cards make the set
        if gets.chomp == "y"
          print "What cards make a set?"
          puts " "

          # Adds card1, card2 and card3 to the set array
          card1 = gets.to_i
          card2 = gets.to_i
          card3 = gets.to_i
          setArray = [card1, card2, card3]

          # Sort the array that way the largest card number is at the end
          setArray = setArray.sort
 
          # Checks to make sure all the guesses are ints greater than 0
          allFixNums = setArray.all? {|i| i.is_a?(Integer) && i > 0 }

          # Checks to make sure all the guesses are at most the number
          # of cards face up (12 or 15)
          inRange = setArray[2] <= cardsShown.size

          # Checks to make sure all the guesses are not the same card
          unique = setArray[1] != setArray[2]
          # If the previous two conditions are true and the set is indeed a SET,
          # then the cards are removed and 3 more are added, given that the deck
          # still has cards left to deal. 
          if allFixNums && unique && inRange && checkSet(cardsShown.getCard(card1-1), cardsShown.getCard(card2-1), cardsShown.getCard(card3-1))
            cardsShown.deleteCard(setArray[2] - 1)
            cardsShown.deleteCard(setArray[1] - 1)
	    cardsShown.deleteCard(setArray[0] - 1)
            if cardsShown.size <= 11 && deck.size!=0
	      cardsShown.draw3more deck
	    end #end if

            playerScore = playerScore + 1
	    setFound = true
  	    puts "You found a set!"
            puts " "
	    puts "Press enter to continue"
	    gets.chomp

          # Otherwise, the user is told that it is not a set and asks
          # if they would like a hint
          else
            puts "Sorry this isn't a set."
	    puts "Do you want a hint? (y/n)"
            # If they say yes to a hint, the user is told what two cards are
	    # in one of the possible sets
	    if gets.chomp == "y" && answerKey.size != 0
	      puts "Two of the cards are #{answerKey[0][0]} and #{answerKey[0][1]}, find the other one!"
              puts " "
              puts "Press enter to try again"
	      gets.chomp
        
              # But if there are no possible sets, then the user is shown a
              # different message implying there are no sets
	    else
	      puts "Look harder, or maybe there isn't a set!"
      	      puts " "
	      puts "Press enter to try again"
	      gets.chomp
	    end #end if
          end #end if
    
        # If the user says there is no set in the 12 face up cards... 
        else 
	  # If there are no sets in the face up cards
	  if answerKey.size == 0
	    # And no cards left in the deck
	    if deck.size==0
	      # Then the game is over and the user's score is displayed 
	      setLoop = false
	      puts "Game over! Your score was #{playerScore}!"
	      if difficulty != 0
	        puts ("The computer\'s score was #{computerScore}!")
	      end
	    else 
	      # If there are still cards in the deck then 3
	      # more are displayed
	      puts "You're right!"
	      puts "Press enter to continue"
	      gets.chomp
	      cardsShown.draw3more deck
	    end #end if
        
          # If there are actually sets in the face up cards...
	  else
	    # If there's only 1 answer
	    if answerKey.size == 1
	      # Tell them there is 1 set and ask if they want a hint
	      # Then display same hint as when they enter a wrong set
	      puts "Actually, there is #{answerKey.size} set."
	      puts "Do you want a hint? (y/n)"
	      if gets.chomp == "y"
	        puts "Two of the cards are #{answerKey[0][0]} and #{answerKey[0][1]}, find the other one!"
                puts " "
	        puts "Press enter to try again"
	        gets.chomp
	      else
	        puts "Look harder, or maybe there isn't a set!"
                puts " "
	        puts "Press enter to try again"
	        gets.chomp
	      end #end if
		
	    # If there's more than 1 answer
	    else
	      # Tell them how many there are and ask if they want a hint
	      # Then display same hint as when they enter a wrong set
	      puts "Actually, there are #{answerKey.size} sets."
	      puts "Do you want a hint? (y/n)"
	      if gets.chomp == "y"
	        puts "Two of the cards are #{answerKey[0][0]} and #{answerKey[0][1]}, find the other one!"
                puts " "
	        puts "Press enter to try again"
	        gets.chomp
	      else
	        puts "Look harder, or maybe there isn't a set!"
                puts " "
	        puts "Press enter to try again"
	        gets.chomp
	      end #end if
	    end #end if
          end #end if
        end # End y/n if-else for "is there a set?"
      end #end do
    rescue Timeout::Error # This is if the computer beats the user

      # If the user has yet to find a set when the timeout occurs,
      # the computer may proceed in winning that round
      if !setFound

        # If there is an actual set in the face up cards
        # the computer finds it, increases it's score
        # then deletes the cards and draws 3 more
        if answerKey.size > 0
	  computerScore = computerScore + 1
	  puts "The computer found a set before you!"
	  puts "Press enter to continue"
	  gets.chomp
          cardsShown.deleteCard(answerKey[0][0] - 1)
          cardsShown.deleteCard(answerKey[0][1] - 1)
          cardsShown.deleteCard(answerKey[0][2] - 1)
          if cardsShown.size <= 11 && deck.size != 0
            cardsShown.draw3more deck
          end #end if
        
	else
      	  # If there are no sets face up, the computer
      	  # either declares the game over if the deck is
      	  # empty, or adds 3 more cards.
          if deck.size == 0
	    setLoop = false
	    puts "The computer couldn't find a set!"
	    puts "Game over! Your score was #{playerScore}!"
	    puts ("The computer\'s score was #{computerScore}!")
	  else
	    puts "The computer couldn't find a set!"
	    puts "Press enter to continue"
            gets.chomp
	    cardsShown.draw3more deck
          end
        end

      # If the user found a set but hasn't pressed enter to restart
      # the loop, the computer cannot still find a set and must let 
      # the user know they won that round
      else # (setFound == true)
	playerScore = playerScore + 1
  	#puts "You found a set!"
        #puts " "
	#puts "Press enter to continue"
	gets.chomp
      end
    end # End Rescue
  end # End Set-Loop

  # After the whole game is over, it asks the user if they would like
  # to play another game, if yes #=> restart, if no #=> end game.
  print "Do you want to play another game? (y/n)"
  if gets.chomp == "n"
    gameLoop = false
  end
end

