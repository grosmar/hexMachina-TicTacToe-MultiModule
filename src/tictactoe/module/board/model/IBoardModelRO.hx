package tictactoe.module.board.model;
import hex.model.IModelRO;
import hex.structures.Point;
import hex.structures.Size;

/**
 * @author duke
 */
interface IBoardModelRO extends IModelRO<IBoardModelListener> 
{
	function getBoardPoint(point:Point):String;
	
	function getEmptyCellCount( ):UInt;

	function getSize( ):Size;
}