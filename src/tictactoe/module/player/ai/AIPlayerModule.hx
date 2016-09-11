package tictactoe.module.player.ai;
import hex.config.stateless.StatelessModuleConfig;
import hex.control.ICompletable;
import hex.module.Module;
import hex.module.dependency.IRuntimeDependencies;
import hex.module.dependency.RuntimeDependencies;
import hex.structures.Point;
import tictactoe.api.IBoard;
import tictactoe.api.IPlayer;
import tictactoe.module.player.ai.controller.AIPlayerController;
import tictactoe.module.player.ai.controller.IAIPlayerController;
import tictactoe.module.player.ai.model.AIPlayerModel;
import tictactoe.module.player.ai.model.IAIPlayerModel;

/**
 * ...
 * @author duke
 */
class AIPlayerModule extends Module implements IPlayer
{

	public function new( sign:String, board:IBoard ) 
	{
		super();
		
		this._injector.mapToValue( IBoard, board );
		
		this._addStatelessConfigClasses( [AIPlayerModuleConfig] );
		
		this._get( IAIPlayerController ).setPlayerSign( sign );
	}
	
	override function _getRuntimeDependencies():IRuntimeDependencies 
	{
		return new RuntimeDependencies();
	}
	
	
	public function setPlayerTurn():ICompletable<Point> 
	{
		return this._get( IAIPlayerController ).setPlayerTurn( );
	}
	
	
	public function getSign():String 
	{
		return this._get( IAIPlayerModel ).getPlayerSign();
	}
	
}

private class AIPlayerModuleConfig extends StatelessModuleConfig
{
	override public function configure():Void 
	{
		this.mapModel( IAIPlayerModel, AIPlayerModel );
		this.mapController( IAIPlayerController, AIPlayerController );
	}
}