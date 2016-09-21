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
	
	public function clone():BoardVO
	{
		var board:BoardVO = new BoardVO(this.size, this.successLineCount);
		
		board.board = [for (i in 0...Std.int(size.height)) [for (j in 0...Std.int(size.width)) this.board[i][j]]];
		
		return board;
	}
	
	public function toString():String
	{
		var s:String = "\n";
		
		for ( i in 0...Std.int(this.size.height) )
		{
			for ( j in 0...Std.int(this.size.width) )
			{
				s += this.board[i][j] != null ? this.board[i][j] : ".";
			}
			
			s += "\n";
		}
		
		return s;
	}
	
	public function getFreeCellCount():UInt 
	{
		var count:UInt = 0;
		
		for ( i in 0...Std.int(this.size.height) )
		{
			for ( j in 0...Std.int(this.size.width) )
			{
				if ( this.board[i][j] == null )
				{
					count++;
				}
			}
		}
		
		return count;
	}
	
}