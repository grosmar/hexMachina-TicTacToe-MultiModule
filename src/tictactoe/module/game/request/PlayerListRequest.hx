package tictactoe.module.game.request;

import hex.control.Request;
import tictactoe.api.IPlayer;

/**
 * ...
 * @author duke
 */
class PlayerListRequest extends Request
{
	public var playerList:Array<IPlayer>;

	public function new(playerList:Array<IPlayer>) 
	{
		this.playerList = playerList;
		
	}
	
}