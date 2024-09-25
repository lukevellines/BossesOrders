C323 / Spring 2024
Final Project Team ReadME
Crimson / Team18
Luke Vellines, Michael Utz
lvelline, mutz
Apr 26


INSTRUCTIONS -
	To play our game, user simply needs to press the "Start Game" button on the Start
	screen, you then will be assigned tasks relating to various Minigames on our other
	views.  To keep playing, you will need to complete these tasks before their individual
	timer runs out.  The game will end if a task is failed, and momentarily an End of Game
	screen will appear before giving a chance to replay.

XCODE -
	Our Final Project was made in Swift UIKit, at XCode version 15.2, our game does
	not need any specific hardware.
	
FEATURES - 
	MVC - Model Files - Model, Boss, Tasks (separated for Composition)
		  Controller Files - CurrController (reads from Model), ViewController, 
		  CleaningViewController, TriviaViewController, MathViewController
		  View Files - CleaningView, Timer, TriviaView, MathView, etc...
	Storage - BestGame var (record) stored persistently through UserDefaults - check model
	2 in-class iOS Frameworks - User Notifications (Model), Settings Storage and difficulty
	change (Model).
	Out of class framework - SpriteKit, endGameScreen func in viewController, and XSprite 
	class
	
CHANGES -
	Core Graphics - We initially planned to use Core Graphics alongside SpriteKit for our
	endGameScreen, but found that SpriteKit was much easier to implement for the entire
	scene.  CoreGraphics was never fully implemented, and was supposed to be created for 
	A5 which is when we made the decision to switch to SpriteKit.  This change is 
	noticeable in the ViewController (endGameScreen()), and XSprite class.
	