package co.getair.meerkat.commands.twitter;

import co.getair.meerkat.dtos.twitter.TweetParams;
import co.getair.meerkat.proxies.TwitterProxy;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class TweetCommad extends SimpleCommand
{
  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    TweetParams localTweetParams = (TweetParams)paramINotification.getBody();
    ((TwitterProxy)getFacade().retrieveProxy("twitterProxy")).tweet(localTweetParams.getTweetText(), localTweetParams.getCompletion());
  }
}