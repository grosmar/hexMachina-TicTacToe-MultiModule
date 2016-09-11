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
		
		Timer.delay( this.aiChoose, Math.floor(Math.random() * 1000) );
		
		return this.playerTurnResponder;
	}
	
	function aiChoose():Void
	{
		//TODO: implement minimax algo
		this.playerTurnResponder.complete( new Point(Math.floor(this.board.getSize().width * Math.random()), Math.floor(this.board.getSize().height * Math.random()) ) );
	}
	
	/*private function getMove()
    {
        var move:Point;
		var score:Int = -2;
		
		var width:UInt = this.board.getSize().width;
		var height:UInt = this.board.getSize().height;
		
			
		for ( i in 0...height) 
		{
			for ( j in 0...width)
			{
				if ( this.board.getBoardPoint(new Point(j, i)) == null ) 
				{
					board[i] = 1;
					var tempScore:Int = -minimax(board, -1);
					board[i] = 0;
					
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
	/*
	function  minimax(int board[9], int player) 
	{
		//How is the position like for player (their turn) on board?
		int winner = win(board);
		if(winner != 0) return winner*player;

		move = -1;
		int score = -2;//Losing moves are preferred to no move
		int i;
		for(i = 0; i < 9; ++i) {//For all moves,
			if(board[i] == 0) {//If legal,
				board[i] = player;//Try the move
				int thisScore = -minimax(board, player*-1);
				if(thisScore > score) {
					score = thisScore;
					move = i;
				}//Pick the one that's worst for the opponent
				board[i] = 0;//Reset board after try
			}
		}
		if(move == -1) return 0;
		return score;
	}*/
	
}