package tictactoe.module.board.controller;
import hex.structures.Size;

/**
 * ...
 * @author duke
 */
interface IBoardController
{
	
	function setBoardPoint(point:Size, sign:String):Void;

	function getBoardPoint(point:Size):String;
	
	function setBoard(size:Size):Void;
}