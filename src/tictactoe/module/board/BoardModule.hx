package tictactoe.module.board;
import hex.config.stateless.StatelessModuleConfig;
import hex.module.Module;
import hex.module.dependency.IRuntimeDependencies;
import hex.module.dependency.RuntimeDependencies;
import hex.structures.Point;
import hex.structures.Size;
import tictactoe.api.IBoard;
import tictactoe.api.IPlayer;
import tictactoe.module.board.controller.BoardController;
import tictactoe.module.board.controller.IBoardController;
import tictactoe.module.board.model.BoardModel;
import tictactoe.module.board.model.IBoardModel;
import tictactoe.module.board.view.IBoardView;

/**
 * ...
 * @author duke
 */
class BoardModule extends Module implements IBoard
{

	public function new(board:Size, boardView:IBoardView) 
	{
		super();
		this._addStatelessConfigClasses( [BoardModuleConfig] );
		
		this._injector.mapToValue( IBoardView, boardView );
		this._injector.injectInto( boardView );
		
		this._get( IBoardController ).setBoard( board );
	}
	
	public function setBoardPoint(point:Point, sign:String):Void 
	{
		this._get( IBoardController ).setBoardPoint( point, sign );
	}
	
	public function getBoardPoint(point:Point):String 
	{
		return this._get( IBoardController ).getBoardPoint( point );
	}
	
	override function _getRuntimeDependencies():IRuntimeDependencies 
	{
		return new RuntimeDependencies();
	}
	
}

private class BoardModuleConfig extends StatelessModuleConfig
{
	override public function configure():Void 
	{
		this.mapModel( IBoardModel, BoardModel );
		this.mapController( IBoardController, BoardController );
	}
}