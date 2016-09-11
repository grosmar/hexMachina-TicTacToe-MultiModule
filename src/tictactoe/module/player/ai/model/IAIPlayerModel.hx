package tictactoe.module.player.ai.model; 
import tictactoe.api.IPlayer;

/**
 * @author duke
 */
interface IAIPlayerModel extends IAIPlayerModelRO
{
  
  function setPlayerSign(sign:String):Void;
  
  function setPlayerTurn():Void;
  
}