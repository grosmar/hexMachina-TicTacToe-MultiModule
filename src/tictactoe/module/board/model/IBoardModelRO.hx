package tictactoe.module.board.model;
import hex.model.IModelRO;
import hex.structures.Point;

/**
 * @author duke
 */
interface IBoardModelRO extends IModelRO<IBoardModelListener> 
{
	function getBoardPoint(point:Point):String;
}