package tictactoe.api;
import hex.structures.Point;
import hex.structures.Size;
import tictactoe.vo.BoardVO;
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
	
	function getBoard():BoardVO;
	
	function getSize():Size;
	
	function getFreeCellCount():UInt;
}