package tictactoe.module.player.user.view;
import hex.control.ICompletable;
import hex.structures.Point;
import hex.view.IView;

/**
 * @author duke
 */
interface IUserPlayerView extends IView
{
  function getChoice():ICompletable<Point>;
}