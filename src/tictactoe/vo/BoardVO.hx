package tictactoe.vo;
import hex.structures.Size;

/**
 * ...
 * @author duke
 */
class BoardVO
{
	public var board:Array<Array<String>>;
	public var size:Size;
	public var successLineCount:UInt;

	public function new( size:Size, successLineCount:UInt ) 
	{
		this.size = size.clone();
		this.board = [for (i in 0...Std.int(size.height)) [for (j in 0...Std.int(size.width)) null]];
		
		this.successLineCount = successLineCount;
	}
	
}