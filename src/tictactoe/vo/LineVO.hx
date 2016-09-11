package tictactoe.vo;
import hex.structures.Point;

/**
 * ...
 * @author duke
 */
class LineVO
{
	public var sign:String;
	public var line:Array<Point>;

	public function new( line:Array<Point>, sign:String ) 
	{
		this.line = line;
		this.sign = sign;
		
	}
	
}