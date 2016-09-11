package tictactoe.module.board.view;
import hex.structures.Point;
import hex.structures.Size;
import tictactoe.vo.LineVO;

/**
 * ...
 * @author ...
 */
interface IBoardView
{
	function setSize(size:Size):Void;
	
	function setBoardCell(point:Point, sign:String):Void;
	
}