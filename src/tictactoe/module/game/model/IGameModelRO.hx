package tictactoe.module.game.model;
import hex.model.IModelRO;
import tictactoe.api.IPlayer;

/**
 * @author duke
 */
interface IGameModelRO extends IModelRO<IGameModelListener> 
{
	function getAcivePlayer():IPlayer;
	
	function getPlayerListLength():UInt;
  
	function getAcivePlayerIndex():UInt;
}