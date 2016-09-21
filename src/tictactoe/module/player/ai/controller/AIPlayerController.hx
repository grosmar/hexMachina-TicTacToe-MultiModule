package tictactoe.module.player.ai.controller;
import haxe.Timer;
import hex.control.AsyncResponder;
import hex.control.ICompletable;
import hex.control.ResultResponder;
import hex.di.IInjectorContainer;
import hex.structures.Point;
import hex.structures.Size;
import tictactoe.api.IBoard;
import tictactoe.module.player.ai.model.IAIPlayerModel;
import tictactoe.util.BoardEvaluator;
import tictactoe.vo.BoardVO;
import tictactoe.vo.LineVO;

/**
 * AI Controller to make AI movements.
 * TODO: minimax is useless for tables bigger than 3x3, so need to implement Alpha Beta algo
 * @author duke
 */
class AIPlayerController implements IAIPlayerController implements IInjectorContainer
{
	var playerTurnResponder:AsyncResponder<Point>;
	
	@Inject
	public var model:IAIPlayerModel;
	
	@Inject
	public var board:IBoard;
	
	public function setPlayerSign( sign:String ):Void
	{
		this.model.setPlayerSign( sign );
	}
	
	public function setPlayerTurn():ICompletable<Point> 
	{
		this.model.setPlayerTurn();
		this.playerTurnResponder = new AsyncResponder<Point>();
		
		Timer.delay(this.aiChoose, 10);
		
		return this.playerTurnResponder;
	}
	
	function aiChoose():Void
	{
		this.playerTurnResponder.complete( this.getMove() );
	}
	
	function getMove():Point
	{
		var bestVal = -1000;
		var bestMove:Point = new Point(-1,-1);
		
		var board:BoardVO = this.board.getBoard();
		
		var width:UInt = Std.int(board.size.width);
		var height:UInt = Std.int(board.size.height);
	 
		// Traverse all cells, evalutae minimax function for
		// all empty cells. And return the cell with optimal
		// value.
		for (i in 0...height)
		{
			for (j in 0...width)
			{
				// Check if celll is empty
				if (board.board[i][j]==null)
				{
					// Make the move
					board.board[i][j] = this.model.getPlayerSign();
	 
					// compute evaluation function for this
					// move.
					var moveVal = minimax(board, 0, false);
	 
					// Undo the move
					board.board[i][j] = null;
	 
					// If the value of the current move is
					// more than the best value, then update
					// best/
					if (moveVal > bestVal)
					{
						bestMove.y = i;
						bestMove.x = j;
						bestVal = moveVal;
					}
				}
			}
		}
 
		return bestMove;
	}
	
	// This is the minimax function. It considers all
	// the possible ways the game can go and returns
	// the value of the board
	function minimax(board:BoardVO, depth:Int, isMax:Bool):Int
	{
		/*if ( depth == 7 )
		{
			return 0;
		}*/
		
		var line = BoardEvaluator.getFullLine(board);
		
		var score:Int;
		
		if ( line == null )
		{
			score = 0;
		}
		else if ( line.sign == this.model.getPlayerSign() )
		{
			score = 10;
		}
		else
		{
			score = -10;
		}
		
		if ( score != 0 )
		{
			return score;
		}
		
		if ( board.getFreeCellCount() == 0 )
		{
			return 0;
		}
		
		var width:UInt = Std.int(board.size.width);
		var height:UInt = Std.int(board.size.height);
		
		// If this maximizer's move
		if (isMax)
		{
			var best:Int = -1000;
			
			// Traverse all cells, evalutae minimax function for
			// all empty cells. And return the cell with optimal
			// value.
			for (i in 0...height)
			{
				for (j in 0...width)
				{
	 					// Check if cell is empty
					if (board.board[i][j]==null)
					{
						// Make the move
						board.board[i][j] = this.model.getPlayerSign();
	 
						// Call minimax recursively and choose
						// the maximum value
						best = Std.int(Math.max( best, minimax(board, depth+1, !isMax) ));
	 
						// Undo the move
						board.board[i][j] = null;
					}
				}
			}
			return best;
		}
	 
		// If this minimizer's move
		else
		{
			var best:Int = 1000;
	 
			// Traverse all cells
			for (i in 0...height)
			{
				for (j in 0...width)
				{
					// Check if cell is empty
					if (board.board[i][j]==null)
					{
						// Make the move
						board.board[i][j] = this.getOpositeSign();
	 
						// Call minimax recursively and choose
						// the minimum value
						best = Std.int(Math.min(best, minimax(board, depth+1, !isMax)));
	 
						// Undo the move
						board.board[i][j] = null;
					}
				}
			}
			return best;
		}
		
		return null;
	}
	
	
	
	function getOpositeSign( ):String
	{
		return this.model.getPlayerSign() == "x" ? "o" : "x";
	}
	
}