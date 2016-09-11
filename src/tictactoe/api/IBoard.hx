package tictactoe.api;
import hex.structures.Point;

/**
 * @author duke
 */
interface IBoard 
{
	function setBoardPoint( point:Point, sign:String ):Void;
	
	function getBoardPoint( point:Point ):String;
}