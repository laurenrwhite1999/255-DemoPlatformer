package code {

	import flash.events.KeyboardEvent;
	import flash.display.Stage;

	/**
	 * This class contains all the code relating to keyboard input.
	 */
	public class KeyboardInput {
		static public var keyLeft: Boolean = false; // left arrow key
		static public var keyUp: Boolean = false; // up arrow key
		static public var keyRight: Boolean = false; // right arrow key
		static public var keyDown: Boolean = false; // down arrow key
		static public var keyEnter: Boolean = false; // enter key

		static public var aKey: Boolean = false; // A key
		static public var wKey: Boolean = false; // W key
		static public var dKey: Boolean = false; // D key
		static public var sKey: Boolean = false; // s key
		
		static public var keySpace:Boolean = false;

		/**
		 * This is the KeyboardInput constructor. It contains the Event
		 * Listeners for KEY_UP and KEY_DOWN.
		 * @param stage This ties the Event Listeners to the Stage
		 */
		public function setup(stage: Stage) {
			stage.addEventListener(KeyboardEvent.KEY_DOWN, handleKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, handleKeyUp);
		} // ends the KeyboardInput() function

		/**
		 * This function determines whether or not the key has been pressed.
		 * @param keyCode This is the number of the key that is pressed.
		 * @param isDown This determines whether or not the key is currently
		 * being pressed.
		 */
		private function updateKey(keyCode: int, isDown: Boolean): void {
			if (keyCode == 13) keyEnter = isDown;
			if (keyCode == 37) keyLeft = isDown; // move player left
			if (keyCode == 38) keyUp = isDown; // move player up
			if (keyCode == 39) keyRight = isDown; // move player right
			if (keyCode == 40) keyDown = isDown; // move player down

			if (keyCode == 65) aKey = isDown; // move player left
			if (keyCode == 87) wKey = isDown; // move player up
			if (keyCode == 68) dKey = isDown; // move player right
			if (keyCode == 83) sKey = isDown; // move player down
			
			if(keyCode == 32) keySpace = isDown;
		} // ends the updateKey() function

		/**
		 * This function calls the updateKey() function, and if the key is
		 * currently being pressed, sets isDown to true.
		 * @param e The Event that is triggered by this KeyboardEvent.
		 */
		public function handleKeyDown(e: KeyboardEvent): void {
			//trace(e.keyCode);
			updateKey(e.keyCode, true);
		} // ends the handleKeyDown function

		/**
		 * This function calls the updateKey() function, and if the key is not
		 * currently being pressed, sets isDown to false.
		 * @param e The Event that is triggered by this KeyboardEvent.
		 */
		public function handleKeyUp(e: KeyboardEvent): void {
			updateKey(e.keyCode, false);
		} // ends the handleKeyUp() function

	} // ends the KeyboardInput class

} // ends the package