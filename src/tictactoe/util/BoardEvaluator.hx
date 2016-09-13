package tictactoe.util;
import hex.structures.Point;
import tictactoe.vo.BoardVO;
import tictactoe.vo.LineVO;

/**
 * ...
 * @author duke
 */
class BoardEvaluator
{

	public function new() 
	{
		
	}
	
	public static function getFullLine( board:BoardVO ):LineVO
	{
		//TODO: get the longest result
		var result:LineVO;
		if ( (result = getFullRow( board )) != null || (result = getFullCol( board )) != null || (result = getFullDiagonal( board )) != null || (result = getFullDiagonalInverse( board )) != null )
		{
			return result;
		}
		
		return null;
	}
	
	public static function getFullRow( board:BoardVO ):LineVO
	{
		var rowList = new Array<Point>();
		var lastRowSign:String = null;
		
		for ( i in 0...Std.int(board.size.height) )
		{
			for ( j in 0...Std.int(board.size.width) )
			{
				var cell:String = board.board[i][j];
				if ( cell != null && cell == lastRowSign )
				{
					rowList.push( new Point(j, i) );
				}
				else
				{
					if ( rowList.length >= board.successLineCount )
					{
						return new LineVO(rowList, lastRowSign );
					}
					
					rowList = [new Point(j, i)];
					lastRowSign = cell;
				}
				
				if ( rowList.length >= board.successLineCount )
				{
					return new LineVO(rowList, lastRowSign );
				}
			}
			
			rowList = [];
		}
		
		return null;
	}
	
	public static function getFullCol( board:BoardVO ):LineVO
	{
		var colList = new Array<Point>();
		var lastColSign:String = null;
		
		for ( j in 0...Std.int(board.size.width) )
		{
			for ( i in 0...Std.int(board.size.height) )
			{
				var cell:String = board.board[i][j];
				if ( cell != null && cell == lastColSign )
				{
					colList.push( new Point(j, i) );
				}
				else
				{
					if ( colList.length >= board.successLineCount )
					{
						return new LineVO(colList, lastColSign );
					}
					
					colList = [new Point(j, i)];
					lastColSign = cell;
				}
				
				if ( colList.length >= board.successLineCount )
				{
					return new LineVO(colList, lastColSign );
				}
			}
			
			colList = [];
		}
		
		return null;
	}
	
	public static function getFullDiagonal( board:BoardVO ):LineVO
	{
		var diagonalList = new Array<Point>();
		var lastDiagonalSign:String;
		
		for ( i in 0...Std.int(board.size.height - board.successLineCount + 1) )
		{
			for ( j in 0...Std.int(board.size.width - board.successLineCount + 1) )
			{	
				lastDiagonalSign = board.board[i][j];
				
				if ( lastDiagonalSign == null )
				{
					continue;
				}
				
				diagonalList = [new Point(j, i)];
				
				for ( k in 1...board.successLineCount )
				{
					var cell:String = board.board[i+k][j+k];
					
					if ( cell != lastDiagonalSign )
					{
						break;
					}
					else
					{
						diagonalList.push( new Point(j+k, i+k) );
					}
				}
				
				if ( diagonalList.length >= board.successLineCount )
				{
					return new LineVO(diagonalList, lastDiagonalSign );
				}
			}
		}
		
		return null;
	}
	
	public static function getFullDiagonalInverse( board:BoardVO ):LineVO
	{
		var diagonalList = new Array<Point>();
		var lastDiagonalSign:String;
		
		var width:UInt = Std.int(board.size.width);
		var height:UInt = Std.int(board.size.height);
		
		for ( i in 0...(height - board.successLineCount + 1) )
		{
			for ( j in 0...(width - board.successLineCount + 1) )
			{	
				lastDiagonalSign = board.board[height-i-1][j];
				
				if ( lastDiagonalSign == null )
				{
					continue;
				}
				
				diagonalList = [new Point(j, height-i-1)];
				
				for ( k in 1...board.successLineCount )
				{
					var cell:String = board.board[height-i-k-1][j+k];
					
					if ( cell != lastDiagonalSign )
					{
						break;
					}
					else
					{
						diagonalList.push( new Point(j+k, height-i-k-1) );
					}
				}
				
				if ( diagonalList.length >= board.successLineCount )
				{
					return new LineVO(diagonalList, lastDiagonalSign );
				}
			}
		}
		
		return null;
	}
	
}