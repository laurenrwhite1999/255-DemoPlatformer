package code {

	public class ColliderAABB {

		private var halfWidth: Number;
		private var halfHeight: Number;

		public var xmin: Number;
		public var xmax: Number;
		public var ymin: Number;
		public var ymax: Number;

		public function ColliderAABB(halfWidth: Number, halfHeight: Number): void {
			setSize(halfWidth, halfHeight);
		} // ends the ColliderAABB() constructor

		public function setSize(halfWidth: Number, halfHeight: Number): void {
			this.halfWidth = halfWidth;
			this.halfHeight = halfHeight;
			
			// recalculate the edges
			calcEdges((xmin + xmax) / 2, (ymin + ymax) / 2);
		}

		/**
		 * Calculate the position of the four edges from the center (x, y) position.
		 */
		public function calcEdges(x: Number, y: Number): void {
			xmin = x - halfWidth;
			xmax = x + halfWidth;
			ymin = y - halfHeight;
			ymax = y + halfHeight;
		} // ends the calcEdges() function

	} // ends the ColliderAABB class

} // ends the package