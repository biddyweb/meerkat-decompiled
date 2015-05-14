package co.getair.meerkat.commands.twitter;

import co.getair.meerkat.proxies.TwitterProxy;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;

public class OptOutTweetsCommand extends SimpleCommand
{
  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    TwitterProxy.setCommentsShouldTweetState(Boolean.FALSE.booleanValue());
  }
}