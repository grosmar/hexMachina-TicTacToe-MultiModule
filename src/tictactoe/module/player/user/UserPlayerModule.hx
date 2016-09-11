package tictactoe.module.player.user;
import hex.config.stateless.StatelessModuleConfig;
import hex.control.ICompletable;
import hex.module.Module;
import hex.module.dependency.IRuntimeDependencies;
import hex.module.dependency.RuntimeDependencies;
import hex.structures.Point;
import tictactoe.api.IBoard;
import tictactoe.api.IPlayer;
import tictactoe.module.player.user.controller.IUserPlayerController;
import tictactoe.module.player.user.controller.UserPlayerController;
import tictactoe.module.player.user.model.IUserPlayerModel;
import tictactoe.module.player.user.model.UserPlayerModel;

/**
 * ...
 * @author duke
 */
class UserPlayerModule extends Module implements IPlayer
{

	public function new( sign:String, board:IBoard ) 
	{
		super();
		this._addStatelessConfigClasses( [UserPlayerModuleConfig] );
		
		this._injector.mapToValue( IBoard, board );
		
		this._get( IUserPlayerController ).setPlayerSign( sign );
	}
	
	override function _getRuntimeDependencies():IRuntimeDependencies 
	{
		return new RuntimeDependencies();
	}
	
	
	public function setPlayerTurn():ICompletable<Point> 
	{
		return this._get( IUserPlayerController ).setPlayerTurn( );
	}
	
	
	public function getSign():String 
	{
		return this._get( IUserPlayerModel ).getPlayerSign();
	}
	
}

private class UserPlayerModuleConfig extends StatelessModuleConfig
{
	override public function configure():Void 
	{
		this.mapModel( IUserPlayerModel, UserPlayerModel );
		this.mapController( IUserPlayerController, UserPlayerController );
	}
}