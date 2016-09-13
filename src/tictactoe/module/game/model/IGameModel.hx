package tictactoe.module.game.model; 
import tictactoe.api.IPlayer;

/**
 * @author duke
 */
interface IGameModel extends IGameModelRO
{
  
  function setPlayerList(playerList:Array<IPlayer>):Void;
  
  function setActivePlayer(index:UInt):IPlayer;
  
  function setDraw():Void;
  
}