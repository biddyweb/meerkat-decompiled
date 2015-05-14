package co.getair.meerkat.commands.twitter;

import co.getair.meerkat.dtos.twitter.RetweetParams;
import co.getair.meerkat.proxies.TwitterProxy;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class RetweetTweetCommand extends SimpleCommand
{
  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    RetweetParams localRetweetParams = (RetweetParams)paramINotification.getBody();
    ((TwitterProxy)getFacade().retrieveProxy("twitterProxy")).retweetTweet(localRetweetParams.getTweetId());
  }
}