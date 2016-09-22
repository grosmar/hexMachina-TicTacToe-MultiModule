package tictactoe;

import hex.compiler.parser.xml.XmlCompiler;
import hex.log.layout.JavaScriptConsoleLayout;
import hex.log.layout.LogProxyLayout;

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
			#if js
				proxy.addListener( new hex.log.layout.JavaScriptConsoleLayout() );
			#end
		#end
		
		new TicTacToe();
	}
	
	public function new()
	{
		#if js
			XmlCompiler.readXmlFile( "tictactoe/config/context.xml" );
		#end
	}
	
}