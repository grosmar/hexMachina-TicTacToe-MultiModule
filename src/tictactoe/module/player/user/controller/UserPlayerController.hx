package tictactoe.module.player.user.controller;
import hex.control.ICompletable;
import hex.control.Responder;
import hex.di.IInjectorContainer;
import hex.structures.Point;
import tictactoe.api.IBoard;
import tictactoe.api.IPlayer;
import tictactoe.module.player.responder.AsyncResponder;
import tictactoe.module.player.user.model.IUserPlayerModel;
import tictactoe.module.player.user.view.IUserPlayerView;

/**
 * ...
 * @author duke
 */
class UserPlayerController implements IUserPlayerController implements IInjectorContainer
{
	var playerTurnResponder:AsyncResponder<Point>;
	
	@Inject
	public var model:IUserPlayerModel;
	
	@Inject
	public var view:IUserPlayerView;
	
	@Inject
	public var board:IBoard;
	
	public function setPlayerSign( sign:String ):Void
	{
		this.model.setPlayerSign( sign );
	}
	
	@Debug
	public function setPlayerTurn():ICompletable<Point> 
	{
		this.model.setPlayerTurn();
		
		playerTurnResponder = new AsyncResponder<Point>( );
		
		this.view.getChoice().onComplete( this.onPlayerTurnResult );
		
		return playerTurnResponder;
	}
	
	@Debug
	function onPlayerTurnResult( point:Point ):Void
	{
		if ( this.board.getBoardPoint(point) != null )
		{
			this.view.getChoice().onComplete( this.onPlayerTurnResult );
		}
		else
		{
			this.playerTurnResponder.complete( point );
		}
	}
	
}