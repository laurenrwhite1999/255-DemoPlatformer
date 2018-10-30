package code {

	import flash.display.MovieClip;


	public class Platform extends MovieClip {

		public var collider: ColliderAABB;

		public function Platform() {
			collider = new ColliderAABB(width / 2, height / 2);
			collider.calcEdges(x, y);
		} // ends the Platform() constructor
		
	} // ends

}