package tictactoe;

import hex.compiler.parser.xml.XmlCompiler;
import hex.log.layout.JavaScriptConsoleLayout;
import hex.log.layout.LogProxyLayout;
import js.Lib;

/**
 * ...
 * @author duke
 */
class TicTacToe 
{
	
	static function main() 
	{
		#if debug
			var proxy : hex.log.layout.LogProxyLayout = new hex.log.layout.LogProxyLayout();
			proxy.addListener( new hex.log.layout.JavaScriptConsoleLayout() );
		#end
		
		new TicTacToe();
	}
	
	public function new()
	{
		XmlCompiler.readXmlFile( "tictactoe/config/context.xml" );
	}
	
}