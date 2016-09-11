package tictactoe.module.game.model;
import hex.model.BasicModel;
import hex.model.ModelDispatcher;
import hex.structures.Point;
import hex.structures.Size;
import tictactoe.api.IPlayer;
import tictactoe.module.game.model.IGameModelListener;

/**
 * ...
 * @author duke
 */
class GameModel extends BasicModel<GameModelDispatcher, IGameModelListener> implements IGameModel
{
	var playerList:Array<IPlayer> = [];
	
	var activeIndex:UInt;
	
	var size:Size;

	public function new() 
	{
		super();
	}
	
	public function setPlayerList( playerList:Array<IPlayer> ):Void
	{
		this.playerList = playerList;
		this.dispatcher.onPlayerListUpdate( playerList );
	}
	
	public function setActivePlayer(index:UInt):IPlayer 
	{
		this.activeIndex = index;
		this.dispatcher.onActivePlayerChange( index );
		return this.playerList[index];
	}
		
	public function getPlayerListLength():UInt 
	{
		return this.playerList.length;
	}
	
	public function getAcivePlayerIndex():UInt 
	{
		return this.activeIndex;
	}
	
	public function getAcivePlayer():IPlayer 
	{
		return this.playerList[this.activeIndex];
	}
	
	
}

private class GameModelDispatcher extends ModelDispatcher<IGameModelListener> implements IGameModelListener
{
	public function onPlayerListUpdate(playerList:Array<IPlayer>):Void
	{
		
	}
	
	public function onActivePlayerChange( index:UInt ):Void
	{
		
	}
	
}