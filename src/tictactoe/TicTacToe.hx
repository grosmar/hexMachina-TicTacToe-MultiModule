package tictactoe;

import hex.compiler.parser.xml.XmlCompiler;
import js.Lib;

/**
 * ...
 * @author duke
 */
class TicTacToe 
{
	
	static function main() 
	{
		new TicTacToe();
	}
	
	public function new()
	{
		XmlCompiler.readXmlFile( "tictactoe/config/context.xml" );
	}
	
}