package tictactoe.module.game.model;
import tictactoe.api.IPlayer;

/**
 * @author duke
 */
interface IGameModelListener
{
	function onPlayerListUpdate(playerList:Array<IPlayer>):Void;
	
	function onActivePlayerChange(player:IPlayer):Void;
}