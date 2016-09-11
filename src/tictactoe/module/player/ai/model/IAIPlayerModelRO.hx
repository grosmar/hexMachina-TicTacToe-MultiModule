package tictactoe.module.player.ai.model;
import hex.model.IModelRO;

/**
 * @author duke
 */
interface IAIPlayerModelRO extends IModelRO<IAIPlayerModelListener> 
{
	function getPlayerSign():String;
}