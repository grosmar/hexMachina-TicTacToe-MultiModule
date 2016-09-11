package tictactoe.api;
import hex.control.ICompletable;
import hex.structures.Point;

/**
 * @author duke
 */
interface IPlayer
{
	function setPlayerTurn():ICompletable<Point>;
	
	function getSign():String;
}