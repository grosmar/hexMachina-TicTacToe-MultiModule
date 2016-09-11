package tictactoe.module.board.view;
import hex.structures.Point;
import hex.structures.Size;

/**
 * ...
 * @author ...
 */
interface IBoardView
{
	function setSize(size:Size):Void;
	
	function setBoardCell(point:Point, sign:String):Void;
}