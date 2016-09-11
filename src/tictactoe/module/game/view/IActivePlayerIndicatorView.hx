package tictactoe.module.game.view;
import tictactoe.api.IPlayer;

/**
 * @author duke
 */
interface IActivePlayerIndicatorView 
{
	function setActivePlayer( sign:String ):Void;
	
	function setPlayerList(playerList:Array<IPlayer>):Void;
}