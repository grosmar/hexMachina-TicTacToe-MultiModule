package tictactoe.module.board.model; 
import hex.structures.Point;
import hex.structures.Size;

/**
 * @author duke
 */
interface IBoardModel extends IBoardModelRO
{
  
  function initBoard( size:Size ):Void;
  
  function setBoardPoint(point:Point, sign:String):Void;
  
}