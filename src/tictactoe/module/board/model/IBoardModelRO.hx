package tictactoe.module.board.model;
import hex.model.IModelRO;
import hex.structures.Point;
import hex.structures.Size;
import tictactoe.vo.BoardVO;
import tictactoe.vo.LineVO;

/**
 * @author duke
 */
interface IBoardModelRO extends IModelRO<IBoardModelListener> 
{
	function getFullLine():LineVO;
	
	function getBoardPoint(point:Point):String;
	
	function getBoard( ):BoardVO;

	function getSize( ):Size;
	
	function getFreeCellCount():UInt;
}