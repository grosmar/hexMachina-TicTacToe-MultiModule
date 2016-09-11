package tictactoe.module.game.controller;
import hex.structures.Size;
import tictactoe.api.IPlayer;

/**
 * ...
 * @author duke
 */
interface IGameController
{
	
	function setPlayerList(playerList:Array<IPlayer>):Void;
	
	function init( ):Void;
}