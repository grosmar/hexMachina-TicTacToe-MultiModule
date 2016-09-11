package tictactoe.module.game.controller;
import hex.di.IInjectorContainer;
import hex.structures.Point;
import hex.structures.Size;
import tictactoe.api.IBoard;
import tictactoe.api.IPlayer;
import tictactoe.module.game.model.IGameModel;

/**
 * ...
 * @author duke
 */
class GameController implements IGameController implements IInjectorContainer
{
	@Inject
	public var model:IGameModel;
	
	@Inject
	public var board:IBoard;
	
	public function setPlayerList( playerList:Array<IPlayer> ):Void
	{
		this.model.setPlayerList( playerList );
	}
	
	public function init( ):Void
	{
		this.setActivePlayer( 0 );
	}
	
	public function nextPlayer( ):Void
	{
		var actIndex:UInt = this.model.getAcivePlayerIndex( );
		var length:UInt = this.model.getPlayerListLength( );
		trace(actIndex, length);
		var nextIndex:UInt = actIndex < length - 1 ? actIndex+1 : 0;
		this.setActivePlayer( nextIndex );
	}
	
	function setActivePlayer( index:UInt ):Void
	{
		trace("setActivePlayer", index );
		var player:IPlayer = this.model.setActivePlayer( index );
		player.setPlayerTurn( ).onComplete( this.onPlayerChoose );
	}
	
	function onPlayerChoose( point:Point ):Void 
	{
		trace("onPlayerChoose", point );
		var player:IPlayer = this.model.getAcivePlayer( );
		
		if ( this.board.getBoardPoint( point ) == null )
		{
			trace("set");
			this.board.setBoardPoint( point, player.getSign() );
			this.nextPlayer();
		}
		else
		{
			trace("Board point already taken");
			this.setActivePlayer( this.model.getAcivePlayerIndex() );
		}
	}
}