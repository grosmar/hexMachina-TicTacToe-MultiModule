package tictactoe.module.board.model;
import hex.model.BasicModel;
import hex.model.ModelDispatcher;
import hex.structures.Point;
import hex.structures.Size;
import tictactoe.module.board.model.IBoardModelListener;
import tictactoe.vo.LineVO;

/**
 * ...
 * @author duke
 */
class BoardModel extends BasicModel<BoardModelDispatcher, IBoardModelListener> implements IBoardModel
{
	var board:Array<Array<String>>;
	var size:Size;
	var successLineCount:UInt;
	var winnerLine:LineVO;

	public function new() 
	{
		super();
	}
		
	public function initBoard( size:Size, successLineCount:UInt ):Void
	{
		this.successLineCount = successLineCount;
		this.size = size.clone();
		this.board = [for (i in 0...Std.int(size.height)) [for (j in 0...Std.int(size.width)) null]];
		this.dispatcher.onBoardInit( size ); 
	}
	
	public function setBoardPoint(point:Point, sign:String):Void 
	{
		this.board[point.y][point.x] = sign;
		this.dispatcher.onBoardUpdate( point, sign );
	}
	
	public function getBoardPoint(point:Point):String 
	{
		return this.board[point.y][point.x];
	}
	
	public function getFullLine():LineVO
	{
		//TODO: get the longest result
		var result:LineVO;
		if ( (result = this.getFullRow()) != null || (result = this.getFullCol()) != null || (result = this.getFullDiagonal()) != null || (result = this.getFullDiagonalInverse()) != null )
		{
			return result;
		}
		
		return null;
	}
	
	public function setWinnerLine(line:LineVO):Void 
	{
		this.winnerLine = line;
		this.dispatcher.onWinnerLine( line );
		
	}
	
	function getFullRow():LineVO
	{
		var rowList = new Array<Point>();
		var lastRowSign:String = null;
		
		for ( i in 0...Std.int(this.size.height) )
		{
			for ( j in 0...Std.int(this.size.width) )
			{
				var cell:String = this.board[i][j];
				if ( cell != null && cell == lastRowSign )
				{
					rowList.push( new Point(j, i) );
				}
				else
				{
					if ( rowList.length >= this.successLineCount )
					{
						return new LineVO(rowList, lastRowSign );
					}
					
					rowList = [new Point(j, i)];
					lastRowSign = cell;
				}
			}
			
			rowList = [];
		}
		
		return null;
	}
	
	function getFullCol():LineVO
	{
		var colList = new Array<Point>();
		var lastColSign:String = null;
		
		for ( j in 0...Std.int(this.size.width) )
		{
			for ( i in 0...Std.int(this.size.height) )
			{
				var cell:String = this.board[i][j];
				if ( cell != null && cell == lastColSign )
				{
					colList.push( new Point(j, i) );
				}
				else
				{
					if ( colList.length >= this.successLineCount )
					{
						return new LineVO(colList, lastColSign );
					}
					
					colList = [new Point(j, i)];
					lastColSign = cell;
				}
			}
			
			colList = [];
		}
		
		return null;
	}
	
	function getFullDiagonal():LineVO
	{
		var diagonalList = new Array<Point>();
		var lastDiagonalSign:String;
		
		for ( i in 0...Std.int(this.size.height - this.successLineCount + 1) )
		{
			for ( j in 0...Std.int(this.size.width - this.successLineCount + 1) )
			{	
				lastDiagonalSign = this.board[i][j];
				
				if ( lastDiagonalSign == null )
				{
					continue;
				}
				
				diagonalList = [new Point(j, i)];
				
				for ( k in 1...this.successLineCount )
				{
					var cell:String = this.board[i+k][j+k];
					
					if ( cell != lastDiagonalSign )
					{
						break;
					}
					else
					{
						diagonalList.push( new Point(j+k, i+k) );
					}
				}
				
				if ( diagonalList.length >= this.successLineCount )
				{
					return new LineVO(diagonalList, lastDiagonalSign );
				}
			}
		}
		
		return null;
	}
	
	function getFullDiagonalInverse():LineVO
	{
		var diagonalList = new Array<Point>();
		var lastDiagonalSign:String;
		
		var width:UInt = Std.int(this.size.width);
		var height:UInt = Std.int(this.size.height);
		
		for ( i in 0...(height - this.successLineCount + 1) )
		{
			for ( j in 0...(width - this.successLineCount + 1) )
			{	
				lastDiagonalSign = this.board[i][width-j];
				
				if ( lastDiagonalSign == null )
				{
					continue;
				}
				
				diagonalList = [new Point(width-j, i)];
				
				for ( k in 1...this.successLineCount )
				{
					var cell:String = this.board[i+k][width-j-k];
					
					if ( cell != lastDiagonalSign )
					{
						break;
					}
					else
					{
						diagonalList.push( new Point(width-j-k, i+k) );
					}
				}
				
				if ( diagonalList.length >= this.successLineCount )
				{
					return new LineVO(diagonalList, lastDiagonalSign );
				}
			}
		}
		
		return null;
	}
	
	
}

private class BoardModelDispatcher extends ModelDispatcher<IBoardModelListener> implements IBoardModelListener
{
	public function onBoardInit(size:Size):Void
	{
		
	}
	
	public function onBoardUpdate(point:Point, sign:String):Void 
	{
		
	}
	
	public function onWinnerLine(line:LineVO):Void 
	{
		
	}
}