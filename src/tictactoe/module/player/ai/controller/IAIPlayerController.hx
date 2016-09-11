package tictactoe.module.player.ai.controller;
import hex.control.ICompletable;
import hex.structures.Point;
import tictactoe.api.IPlayer;

/**
 * ...
 * @author duke
 */
interface IAIPlayerController
{
	
	function setPlayerSign(sign:String):Void;
	
	function setPlayerTurn():ICompletable<Point>;
}