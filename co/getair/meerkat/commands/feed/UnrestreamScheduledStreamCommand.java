package co.getair.meerkat.commands.feed;

import co.getair.meerkat.dtos.feed.StreamFeedScheduledItemProxy;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;

public class UnrestreamScheduledStreamCommand extends SimpleCommand
{
  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    ((StreamFeedScheduledItemProxy)paramINotification.getBody()).unrestreamScheduledStream();
  }
}