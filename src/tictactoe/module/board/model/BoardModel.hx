package tictactoe.module.board.model;
import hex.model.BasicModel;
import hex.model.ModelDispatcher;
import hex.structures.Point;
import hex.structures.Size;
import tictactoe.module.board.model.IBoardModelListener;

/**
 * ...
 * @author duke
 */
class BoardModel extends BasicModel<BoardModelDispatcher, IBoardModelListener> implements IBoardModel
{
	var board:Array<Array<String>>;
	var size:Size;

	public function new() 
	{
		super();
	}
		
	public function initBoard( size:Size ):Void
	{
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
	
	
}

private class BoardModelDispatcher extends ModelDispatcher<IBoardModelListener> implements IBoardModelListener
{
	public function onBoardInit(size:Size):Void
	{
		
	}
	
	public function onBoardUpdate(point:Point, sign:String):Void 
	{
		
	}
}