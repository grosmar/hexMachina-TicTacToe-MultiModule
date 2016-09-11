package tictactoe.module.player.user.model;
import hex.model.BasicModel;
import hex.model.ModelDispatcher;
import tictactoe.api.IPlayer;
import tictactoe.module.player.user.model.IUserPlayerModelListener;

/**
 * ...
 * @author duke
 */
class UserPlayerModel extends BasicModel<GameModelDispatcher, IUserPlayerModelListener> implements IUserPlayerModel
{
	var playerSign:String;
	
	var _active:Bool = false;

	public function new() 
	{
		super();
	}
	
	public function setPlayerSign( playerSign:String ):Void
	{
		this.playerSign = playerSign;
		this.dispatcher.onPlayerSignUpdate( playerSign );
	}
	
	public function getPlayerSign():String 
	{
		return this.playerSign;
	}
	
	public function setPlayerTurn():Void 
	{
		this._active = true;
		this.dispatcher.onPlayerTurn();
	}
	
	
}

private class GameModelDispatcher extends ModelDispatcher<IUserPlayerModelListener> implements IUserPlayerModelListener
{
	public function onPlayerSignUpdate(sign:String):Void
	{
		
	}
	
	public function onPlayerTurn():Void
	{
		
	}
}