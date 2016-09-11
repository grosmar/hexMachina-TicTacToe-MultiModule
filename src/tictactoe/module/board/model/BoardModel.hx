package tictactoe.module.board.model;
import hex.model.BasicModel;
import hex.model.ModelDispatcher;
import hex.structures.Point;
import hex.structures.Size;
import tictactoe.module.board.model.IBoardModelListener;
import tictactoe.util.BoardEvaluator;
import tictactoe.vo.BoardVO;
import tictactoe.vo.LineVO;

/**
 * ...
 * @author duke
 */
class BoardModel extends BasicModel<BoardModelDispatcher, IBoardModelListener> implements IBoardModel
{
	
	var winnerLine:LineVO;
	var board:BoardVO;

	public function new() 
	{
		super();
		
	}
		
	public function initBoard( size:Size, successLineCount:UInt ):Void
	{
		this.board = new BoardVO(size, successLineCount);
		this.dispatcher.onBoardInit( this.board.size ); 
	}
	
	public function setBoardPoint(point:Point, sign:String):Void 
	{
		this.board.board[point.y][point.x] = sign;
		this.dispatcher.onBoardUpdate( point, sign );
	}
	
	public function getBoardPoint(point:Point):String 
	{
		return this.board.board[point.y][point.x];
	}
	
	public function getFullLine():LineVO
	{
		return BoardEvaluator.getFullLine(this.board);
	}
	
	public function setWinnerLine(line:LineVO):Void 
	{
		this.winnerLine = line;
		this.dispatcher.onWinnerLine( line );
		
	}
		
	public function getSize():Size 
	{
		return this.board.size.clone();
	}
	
	
	public function getEmptyCellCount():UInt 
	{
		return 0; //TODO: implement or remove
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