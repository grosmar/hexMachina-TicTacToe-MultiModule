package tictactoe.module.game;
import hex.config.stateless.StatelessModuleConfig;
import hex.module.Module;
import hex.module.dependency.IRuntimeDependencies;
import hex.module.dependency.RuntimeDependencies;
import tictactoe.api.IBoard;
import tictactoe.api.IPlayer;
import tictactoe.module.game.controller.GameController;
import tictactoe.module.game.controller.IGameController;
import tictactoe.module.game.model.GameModel;
import tictactoe.module.game.model.IGameModel;
import tictactoe.module.game.view.IActivePlayerIndicatorView;

/**
 * ...
 * @author duke
 */
class GameModule extends Module
{

	public function new(player1:IPlayer, player2:IPlayer, board:IBoard, ?activePlayerIndicatorView:IActivePlayerIndicatorView) 
	{
		super();
		this._injector.mapToValue( IBoard, board );
		
		this._addStatelessConfigClasses( [GameModuleConfig] );
		
		if ( activePlayerIndicatorView != null )
		{
			this._injector.injectInto(activePlayerIndicatorView);
		}
		
		this._get( IGameController ).setPlayerList( [player1, player2] );
	}
	
	override function _getRuntimeDependencies():IRuntimeDependencies 
	{
		return new RuntimeDependencies();
	}
	
	
	override public function _onInitialisation():Void 
	{
		super._onInitialisation();
		
		this._get( IGameController ).init( );
	}
}

private class GameModuleConfig extends StatelessModuleConfig
{
	override public function configure():Void 
	{
		this.mapModel( IGameModel, GameModel );
		this.mapController( IGameController, GameController );
	}
}