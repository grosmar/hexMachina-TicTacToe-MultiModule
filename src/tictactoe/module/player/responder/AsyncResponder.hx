package tictactoe.module.player.responder;

import hex.control.ICompletable;

/**
 * ...
 * @author duke
 */
class AsyncResponder<ResultType> implements ICompletable<ResultType>
{
	var completeCallback:ResultType->Void;
	var failCallback:String->Void;

	public function new() 
	{
		
	}
	
	
	public function onComplete(callback:ResultType->Void ):ICompletable<ResultType> 
	{
		this.completeCallback = callback;
		return this;
	}
	
	public function onFail(callback:String->Void):ICompletable<ResultType> 
	{
		this.failCallback = callback;
		return this;
		
	}
	
	public function complete( result:ResultType ):Void
	{
		this.completeCallback( result );
	}
	
	public function fail( reason:String ):Void
	{
		this.failCallback( reason );
	}
	
}