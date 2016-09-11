package tictactoe.module.player.ai.model;
import tictactoe.api.IPlayer;

/**
 * @author duke
 */
interface IAIPlayerModelListener
{
	function onPlayerSignUpdate(sign:String):Void;
	
	function onPlayerTurn():Void;
}