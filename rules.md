For best experience, read these rules at:
[https://github.com/cse3901-osu2016sp-1730/Set/blob/master/rules.md][1]

#The Game of SET#
The object of the game is to identify a SET of 3 cards from 12 cards placed face up on the table. Each card has four features, which can vary as follow:
	
	*Shape*
	  Diamond: <>
	  Oval:    ()
	  Square:  []

	*Number*
	  1 (diamond):  <>
	  2 (diamonds): <><>
	  3 (diamonds): <><><>

	*Color*
	  Red:   (red text)
	  Blue:  (blue text)
	  Green: (green text)

	*Shading*
	  Solid (oval):    (*)
	  Striped (oval):  (-)
	  Outlined (oval): ()
	
A set consists of 3 cards in which each of the cards' features, looked at one-by-one, are the same on each card, or, are different on each card. All of the features must separately satisfy this rule. In other words: shape must be either the same on all 3 cards, or different on each of the 3 cards; color must be either the same on all 3 cards, or different on each of the 3, etc.

##A QUICK CHECK - Is it a SET?##
If 2 cards are the same and 1 card is different in any feature, then it is not a SET. For example, if 2 are red and 1 is blue, then it is not a SET. A SET must be either all the same OR all different in each individual feature.

##THE PLAY##
The dealer (the computer is the dealer) shuffles the cards and lays 12 face up on the table. The player (you) decide if there is a set on the table. If you correctly identify a set, you receive a point and the 3 cards are replaced with 3 cards from the deck. If you incorrectly identify a SET, then the cards stay face up and you lose one point. The goal is to have the maximum amount of points, 27, by the end of the game.

If you believe there is not SET in the 12 cards, 3 more cards are laid face up. The 3 cards are not replaced when the next SET is found, reducing the number back to 12.

>Note: There are ~33:1 odds that a SET is present in 12 cards, and ~2500:1 odds when 15 cards are on the table.

The play continues until the deck is depleted. At the end of the game there may be cards remaining that do not form a SET.

##HOW TO PLAY ON THE COMPUTER##
The game will first begin by asking you if you want to read the rules, if you pressed yes then you are reading this. Otherwise, hopefully you know the rules. Next the game will ask you to choose a difficulty level where 0 is for solo play, 1 is easy, 2 is medium, and 3 is hard. The difficulty levels correspond to how long it takes the computer to find a set before you. Easy is 90 seconds, medium is 30 seconds, and hard is 15 seconds.

After choosing a difficulty level, the game will immediately begin and you will be shown the 12 face up cards. You will also be asked to identify if there is a set or not.

> - If you say there is a set, then you enter the 3 cards' numbers each followed by <enter>. If you are right, three more cards will be dealed and the game will continue. If you are wrong, you will be asked if you want a hint. After you answer this question, the game will continue.

> - If you say there is NO set and you are right, 3 more cards will be dealed and there will now be 15 face up cards. If you are wrong, you will be told how many sets there are and asked if you would like a hint. After you answer, the game will continue.

[1]: http://setgame.com
