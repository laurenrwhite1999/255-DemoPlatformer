package code {

	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.ui.Keyboard;

	/**
	 * This class controls the player.
	 */
	public class Player extends MovieClip {

		/** The gravity that is applied to the player as it falls. */
		private var gravity: Point = new Point(0, 300);
		/** The max speed that the player can move left or right. */
		private var maxSpeed: Number = 200;
		/** The velocity of the player. */
		private var velocity: Point = new Point(1, 5);

		/** The rate at which the player accelerates left or right. */
		private const HORIZONTAL_ACCELERATION: Number = 800;
		/** The rate at which the player decelerates left or right. */
		private const HORIZONTAL_DECELERATION: Number = 800;

		/** The rate at which the player accelerates up or down. */
		private const VERTICAL_ACCELERATION: Number = 800;
		/** The rate at which the player decelerates up or down. */
		private const VERTICAL_DECELERATION: Number = 1600;

		/** Stores whether or not the player is currently on the ground. */
		private var isPlayerOnGround: Boolean = false;

		/**
		 * This is the Player constructor code.
		 */
		public function Player() {

		} // ends the Player() constuctor

		/**
		 * This function updates the player each frame.
		 */
		public function update(): void {
			handleWalking();

			handleJumping();

			doPhysics();

			detectGround();
		} // ends the update() function

		/**
		 * This function allows the player to walk left or right.
		 */
		private function handleWalking(): void {
			if (KeyboardInput.isKeyDown(Keyboard.LEFT)) velocity.x -= HORIZONTAL_ACCELERATION * Time.dt;
			if (KeyboardInput.isKeyDown(Keyboard.RIGHT)) velocity.x += HORIZONTAL_ACCELERATION * Time.dt;

			if (!KeyboardInput.isKeyDown(Keyboard.LEFT) && !KeyboardInput.isKeyDown(Keyboard.RIGHT)) { // left and right not being pressed...
				if (velocity.x < 0) { // moving left
					velocity.x += HORIZONTAL_DECELERATION * Time.dt; // accelerate right
					if (velocity.x > 0) velocity.x = 0; // clamp at 0
				}
				if (velocity.x > 0) { // moving right
					velocity.x -= HORIZONTAL_DECELERATION * Time.dt; // accelerate left
					if (velocity.x < 0) velocity.x = 0; // clamp at 0
				}
			}
		} // ends the handleWalking() function

		/**
		 * This function makes the player jump if the spacebar is pressed.
		 */
		private function handleJumping(): void {
			if (isPlayerOnGround) {
				if (KeyboardInput.isKeyDown(Keyboard.SPACE)) velocity.y -= VERTICAL_ACCELERATION * Time.dt;

				if (!KeyboardInput.isKeyDown(Keyboard.SPACE)) { // spacebar is not being pressed
					if (velocity.y < 0) { // moving up
						velocity.y += VERTICAL_DECELERATION * Time.dt; // accelerate up
						if (velocity.y > 0) velocity.y = 0; // clamp at 0
					}
				}
			}
		} // ends the handleJumping() function

		/**
		 * This function applies the physics to the player character.
		 */
		private function doPhysics(): void {
			// apply gravity to velocity:
			velocity.x += gravity.x * Time.dt;
			velocity.y += gravity.y * Time.dt;

			// constrain to maxSpeed
			if (velocity.x > maxSpeed) velocity.x = maxSpeed; // clamp going right
			if (velocity.x < -maxSpeed) velocity.x = -maxSpeed; // clamp going left

			// apply velocity to position
			x += velocity.x * Time.dt;
			y += velocity.y * Time.dt;
		} // ends the doPhysics() function

		/**
		 * This function detects when the player has touched the ground.
		 */
		private function detectGround(): void {
			//look at y position
			var ground: Number = 350
			if (y > ground) {
				y = ground; // clamp
				velocity.y = 0;
				isPlayerOnGround = true;
			}
		} // ends the detectGround() function

	} // ends Player class

} // ends package