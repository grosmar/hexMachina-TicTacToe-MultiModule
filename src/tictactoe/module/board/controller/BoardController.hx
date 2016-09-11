package tictactoe.module.board.controller;
import hex.di.IInjectorContainer;
import hex.structures.Size;
import tictactoe.module.board.model.IBoardModel;
import tictactoe.vo.LineVO;

/**
 * ...
 * @author duke
 */
class BoardController implements IBoardController implements IInjectorContainer
{
	@Inject
	public var model:IBoardModel;
	
	public function setBoard(size:Size, successLineCount:UInt ):Void 
	{
		this.model.initBoard( size, successLineCount );
	}
	
	public function setBoardPoint(point:Size, sign:String):Void
	{
		this.model.setBoardPoint(point, sign);
	}
	
	public function getBoardPoint(point:Size):String
	{
		return this.model.getBoardPoint(point);
	}
	
	public function getFullLine():LineVO 
	{
		return this.model.getFullLine();
	}
	
	public function setWinnerLine(line:LineVO) 
	{
		this.model.setWinnerLine( line );
	}
}