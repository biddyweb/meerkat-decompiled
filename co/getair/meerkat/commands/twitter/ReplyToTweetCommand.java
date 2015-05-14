package co.getair.meerkat.commands.twitter;

import co.getair.meerkat.dtos.twitter.ReplyParams;
import co.getair.meerkat.proxies.TwitterProxy;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class ReplyToTweetCommand extends SimpleCommand
{
  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    ReplyParams localReplyParams = (ReplyParams)paramINotification.getBody();
    ((TwitterProxy)getFacade().retrieveProxy("twitterProxy")).replyTweet(localReplyParams.getContent(), localReplyParams.getOriginalTweetUsername(), localReplyParams.getTweetId());
  }
}