package tictactoe.module.player.user.controller;
import hex.control.ICompletable;
import hex.di.IInjectorContainer;
import hex.structures.Point;
import tictactoe.api.IPlayer;
import tictactoe.module.player.user.model.IUserPlayerModel;
import tictactoe.module.player.user.view.IUserPlayerView;

/**
 * ...
 * @author duke
 */
class UserPlayerController implements IUserPlayerController implements IInjectorContainer
{
	@Inject
	public var model:IUserPlayerModel;
	
	@Inject
	public var view:IUserPlayerView;
	
	public function setPlayerSign( sign:String ):Void
	{
		this.model.setPlayerSign( sign );
	}
	
	public function setPlayerTurn():ICompletable<Point> 
	{
		this.model.setPlayerTurn();
		
		return this.view.getChoice( );
	}
	
}