package tictactoe.module.player.user.model;
import tictactoe.api.IPlayer;

/**
 * @author duke
 */
interface IUserPlayerModelListener
{
	function onPlayerSignUpdate(sign:String):Void;
	
	function onPlayerTurn():Void;
}