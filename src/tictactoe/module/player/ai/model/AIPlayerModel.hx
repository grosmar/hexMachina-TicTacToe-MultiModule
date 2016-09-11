package tictactoe.module.player.ai.model;
import hex.model.BasicModel;
import hex.model.ModelDispatcher;
import tictactoe.api.IPlayer;
import tictactoe.module.player.ai.model.IAIPlayerModelListener;

/**
 * ...
 * @author duke
 */
class AIPlayerModel extends BasicModel<GameModelDispatcher, IAIPlayerModelListener> implements IAIPlayerModel
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

private class GameModelDispatcher extends ModelDispatcher<IAIPlayerModelListener> implements IAIPlayerModelListener
{
	public function onPlayerSignUpdate(sign:String):Void
	{
		
	}
	
	public function onPlayerTurn():Void
	{
		
	}
}