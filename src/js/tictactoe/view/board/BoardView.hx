package js.tictactoe.view.board;

import hex.structures.Point;
import hex.structures.Size;
import hex.view.BasicView;
import js.html.Element;
import js.html.TableElement;
import js.html.TableRowElement;
import tictactoe.api.IPlayer;
import tictactoe.module.board.model.IBoardModelListener;
import tictactoe.module.board.model.IBoardModelRO;
import tictactoe.module.board.view.IBoardView;
import tictactoe.vo.LineVO;

/**
 * ...
 * @author ...
 */
class BoardView extends BasicView implements IBoardView implements IBoardModelListener
{
	var container:TableElement;
	
	@Inject
	public var model:IBoardModelRO;

	public function new(container:Element) 
	{
		super();
		this.container = cast container;
		
	}
	
	@PostConstruct
	public function init():Void
	{
		this.model.addListener(this);
	}
	
	public function setSize( size:Size ):Void
	{
		var tbody:Element = this.container.tBodies.item(0);
		
		tbody.innerHTML = "";
		
		for (i in 0...Std.int(size.height)) 
		{
			var tr:TableRowElement = cast container.insertRow();
			for (j in 0...Std.int(size.width)) 
			{
				var tc:Element = tr.insertCell();
			}
        }
    }
	
	public function setBoardCell( point:Point, sign:String ):Void
	{
		var cell = cast(this.container.rows.item(point.y), TableRowElement).cells.item(point.x);
		//cell.classList.add("is-filled");
		cell.innerHTML = sign.toUpperCase();
	}
	
	public function setWinnerLine( line:LineVO ):Void
	{
		for (i in 0...line.line.length)
		{
			cast(this.container.rows.item(line.line[i].y), TableRowElement).cells.item(line.line[i].x).classList.add("is-winner-cell");
		}
	}
	
	public function onWinnerLine( line:LineVO ):Void
	{
		this.setWinnerLine( line );
	}
	
	public function onBoardInit(size:Size):Void 
	{
		this.setSize( size );
	}
	
	public function onBoardUpdate(point:Point, sign:String):Void 
	{
		this.setBoardCell( point, sign );
	}
	
}