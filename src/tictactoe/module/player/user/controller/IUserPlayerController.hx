package tictactoe.module.player.user.controller;
import hex.control.ICompletable;
import hex.structures.Point;
import tictactoe.api.IPlayer;

/**
 * ...
 * @author duke
 */
interface IUserPlayerController
{
	
	function setPlayerSign(sign:String):Void;
	
	function setPlayerTurn():ICompletable<Point>;
}