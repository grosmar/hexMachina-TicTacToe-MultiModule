package tictactoe.module.player.user.model; 
import tictactoe.api.IPlayer;

/**
 * @author duke
 */
interface IUserPlayerModel extends IUserPlayerModelRO
{
  
  function setPlayerSign(sign:String):Void;
  
  function setPlayerTurn():Void;
  
}