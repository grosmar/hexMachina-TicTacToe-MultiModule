package tictactoe.api;
import hex.structures.Point;
import tictactoe.vo.LineVO;

/**
 * @author duke
 */
interface IBoard 
{
	function setBoardPoint( point:Point, sign:String ):Void;
	
	function getBoardPoint( point:Point ):String;
	
	function getFullLine():LineVO;
	
	function setWinnerLine(line:LineVO):Void;
}