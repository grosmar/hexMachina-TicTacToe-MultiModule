package tictactoe.module.board.controller;
import hex.structures.Size;
import tictactoe.vo.LineVO;

/**
 * ...
 * @author duke
 */
interface IBoardController
{
	
	function setBoardPoint(point:Size, sign:String):Void;

	function getBoardPoint(point:Size):String;
	
	function getFullLine( ):LineVO;
	
	function setBoard(size:Size, successLineCount:UInt ):Void;
	
	function setWinnerLine(line:LineVO):Void;
}