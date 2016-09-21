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
 * ...
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
		//this.playerTurnResponder.complete( this.getMove() );
		this.playerTurnResponder.complete( this.getMove2() );
	}
	/*
	function getMove3(depth:Int, turn:Int):Point
	{
        if (hasXWon()) return +1; 
        if (hasOWon()) return -1;

        List<Point> pointsAvailable = getAvailableStates();
        if (pointsAvailable.isEmpty()) return 0; 
 
        int min = Integer.MAX_VALUE, max = Integer.MIN_VALUE;
         
        for (int i = 0; i < pointsAvailable.size(); ++i) {  
            Point point = pointsAvailable.get(i);   
            if (turn == 1) { 
                placeAMove(point, 1); 
                int currentScore = minimax(depth + 1, 2);
                max = Math.max(currentScore, max);
                
                if(depth == 0)System.out.println("Score for position "+(i+1)+" = "+currentScore);
                if(currentScore >= 0){ if(depth == 0) computersMove = point;} 
                if(currentScore == 1){board[point.x][point.y] = 0; break;} 
                if(i == pointsAvailable.size()-1 && max < 0){if(depth == 0)computersMove = point;}
            } else if (turn == 2) {
                placeAMove(point, 2); 
                int currentScore = minimax(depth + 1, 1);
                min = Math.min(currentScore, min); 
                if(min == -1){board[point.x][point.y] = 0; break;}
            }
            board[point.x][point.y] = 0; //Reset this point
        } 
        return turn == 1?max:min;
	}*/
	
	function getMove2():Point
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
	
	/*
	private function getMove():Point
    {
        var move:Point = null;
		var score:Int = -2;
		
		var board:BoardVO = this.board.getBoard();
		
		var width:UInt = Std.int(board.size.width);
		var height:UInt = Std.int(board.size.height);
			
		for ( i in 0...height) 
		{
			for ( j in 0...width)
			{
				if ( board.board[i][j] == null ) 
				{
					board.board[i][j] = this.model.getPlayerSign();
					var tempScore:Int = -this.minimax(board, this.getOpositeSign(), 0);
					board.board[i][j] = null;
					
					if (tempScore > score) 
					{
						score = tempScore;
						move = new Point(j, i);
					}
				}
			}
		}
		//returns a score based on minimax tree at a given node.
		return move;
    }
	
	function minimax(board:BoardVO, player:String, depth:UInt):Int
	{
		//How is the position like for player (their turn) on board?
		
		depth++;
		
		if ( depth == 20 )
		{
			return 0;
		}
		
		var winData = BoardEvaluator.getFullLine(board);
		
		if (winData != null )
		{
			var winner:Int = winData.sign == player ? 1 : -1;
			
			return depth * winner * this.getPlayerValue(player);
		}
		
		var move:Point = null;
		var score:Int = -depth;//Losing moves are preferred to no move
		
		//For all moves,
		var width:UInt = Std.int(board.size.width);
		var height:UInt = Std.int(board.size.height);
			
		for ( i in 0...height) 
		{
			for ( j in 0...width)
			{
				if (board.board[i][j] == null) 
				{//If legal,
					board.board[i][j] = player;//Try the move
					var thisScore:Int = -this.minimax(board, this.invertSign(player), depth);
					
					if (thisScore > score) 
					{
						//trace(board);
						//trace(depth, player, thisScore, score, this.getPlayerValue(player));
						score = thisScore;
						move = new Point(j, i);
						
					}//Pick the one that's worst for the opponent
					
					board.board[i][j] = null;//Reset board after try
				}
			}
		}
		
		if (move == null) 
		{
			return 0;
		}
		
		return score;
	}*/
	
	function getPlayerValue( player:String ):Int
	{
		return player == this.model.getPlayerSign() ? 1 : -1;
	}
	
	function getOpositeSign( ):String
	{
		return this.model.getPlayerSign() == "x" ? "o" : "x";
	}
	
	function invertSign( sign:String ):String
	{
		return sign == "x" ? "o" : "x";
	}
	
}