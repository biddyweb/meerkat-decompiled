package co.getair.meerkat.commands.twitter;

import co.getair.meerkat.dtos.twitter.FavoriteParams;
import co.getair.meerkat.proxies.TwitterProxy;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class FavoriteTweetCommand extends SimpleCommand
{
  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    FavoriteParams localFavoriteParams = (FavoriteParams)paramINotification.getBody();
    ((TwitterProxy)getFacade().retrieveProxy("twitterProxy")).favoriteTweet(localFavoriteParams.getTweetId());
  }
}