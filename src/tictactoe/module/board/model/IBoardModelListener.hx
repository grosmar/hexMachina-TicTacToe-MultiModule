package tictactoe.module.board.model;
import hex.structures.Point;
import hex.structures.Size;

/**
 * @author duke
 */
interface IBoardModelListener
{
	function onBoardInit(size:Size):Void;
	
	function onBoardUpdate(point:Point, sign:String):Void;
}