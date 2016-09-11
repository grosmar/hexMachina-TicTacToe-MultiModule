package tictactoe.module.player.user.model;
import hex.model.IModelRO;

/**
 * @author duke
 */
interface IUserPlayerModelRO extends IModelRO<IUserPlayerModelListener> 
{
	function getPlayerSign():String;
}