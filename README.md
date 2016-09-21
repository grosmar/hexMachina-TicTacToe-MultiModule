# hexMachina-TicTacToe
Modular TicTacToe example written in Haxe using [hexMachina](http://hexmachina.org) framework.
This is just a simple example how a simple game like tic-tac-toe can made modular and extendable, and also a showcase of the possibilities of describing components in DSL.

#Demo
You can try the game here: https://grosmar.github.io/hexMachina-TicTacToe/bin/index.html

#Install
1. Clone repository
2. Execute `haxelib install build.hxml`

#Build
1. Execute `haxe build.hxml`
2. Run bin/index.html

As an alternative you can use [HaxeDevelop](http://haxedevelop.org) with the TicTacToe.hxproj project file.

#Customize
Change board size by changing in context.xml boardSize node (by default 3x3):
```
    <bean id="boardSize" type="hex.structures.Size">
	    <argument value="3" type="Float" />
    	<argument value="3" type="Float" />
    </bean>
```
Change player signs (in this example x parameter):
```
    <module id="userPlayer1" type="tictactoe.module.player.user.UserPlayerModule">
		<argument ref="userPlayerView" />
		<argument value="x" />
		<argument ref="boardModule" />
	</module>
```
Change players for the game (for multi player or single player, default it's user vs ai):
```
    <module id="gameModule" type="tictactoe.module.game.GameModule">
		<argument ref="boardModule" />
		<argument ref="activePlayerIndicatorView" />
		
		<argument ref="userPlayer1" />
		<!--
		<argument ref="userPlayer2" />
		<argument ref="userPlayer3" />
		-->
		<argument ref="aiPlayer1" />
	</module>
```
Change amount of sign in a line to win (default by 3):
```
    <module id="boardModule" type="tictactoe.module.board.BoardModule">
		<argument ref="boardSize" />
		<argument value="3" type="UInt" />
		<argument ref="boardView" />
	</module>
```
#Todo
- AI minimax algorithm is too slow for table bigger then 3x3. It should be combined with alpha-beta
- Create unit test
- Check against duplicated signs in the GameModule