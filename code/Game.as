package code {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * This is the class that runs the game.
	*/
	public class Game extends MovieClip {
		
		/**
		 * This function sets up the keyboard input and adds the event listener
		 * for the game loop.
		 */
		public function Game() {
			KeyboardInput.setup(stage);
			addEventListener(Event.ENTER_FRAME, gameLoop);
		} // ends the Game() function
		
		/**
		 * This is the game loop. It runs the game.
		 */
		private function gameLoop(e:Event):void {
			Time.update();
			player.update();
			
			KeyboardInput.update();
		} // ends the gameLoop() function
		
	} // ends Game class
	
} // ends package
