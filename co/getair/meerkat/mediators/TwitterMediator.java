package co.getair.meerkat.mediators;

import co.getair.meerkat.dtos.AddCommentParams;
import co.getair.meerkat.dtos.DidSubscribeParams;
import co.getair.meerkat.dtos.twitter.FavoriteParams;
import co.getair.meerkat.dtos.twitter.ReplyParams;
import co.getair.meerkat.dtos.twitter.RetweetParams;
import co.getair.meerkat.dtos.twitter.TweetParams;
import co.getair.meerkat.dtos.watch_broadcast.BroadcastBeganParams;
import co.getair.meerkat.proxies.TwitterProxy;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.facade.Facade;
import org.puremvc.java.multicore.patterns.mediator.Mediator;

public class TwitterMediator extends Mediator
{
  public TwitterMediator()
  {
    super(GetMediatorName(), null);
  }

  public static String GetMediatorName()
  {
    return "TwitterMediator";
  }

  public void handleNotification(INotification paramINotification)
  {
    if ((paramINotification.getName().equals("eventCommentAdded")) && (TwitterProxy.isCommentsShouldTweet()))
    {
      AddCommentParams localAddCommentParams = (AddCommentParams)paramINotification.getBody();
      ReplyParams localReplyParams = new ReplyParams(localAddCommentParams.getContent(), localAddCommentParams.getOriginalTweetId(), localAddCommentParams.getBroadcasterUsername());
      getFacade().sendNotification("commandReplyToTweet", localReplyParams, null);
    }
    if (paramINotification.getName().equals("eventStreamLiked"))
    {
      FavoriteParams localFavoriteParams1 = new FavoriteParams((String)paramINotification.getBody());
      getFacade().sendNotification("commandFavoriteTweet", localFavoriteParams1, null);
    }
    if ((paramINotification.getName().equals("eventStreamRestreamed")) || (paramINotification.getName().equals("scheduledEventRestreamedCommand")))
    {
      RetweetParams localRetweetParams = new RetweetParams((String)paramINotification.getBody());
      getFacade().sendNotification("commandRetweetTweet", localRetweetParams, null);
    }
    if (paramINotification.getName().equals("scheduledEventSubscribedCommand"))
    {
      FavoriteParams localFavoriteParams2 = new FavoriteParams(((DidSubscribeParams)paramINotification.getBody()).getTweetId());
      getFacade().sendNotification("commandFavoriteTweet", localFavoriteParams2, null);
    }
    if (paramINotification.getName().equals("eventBroadcastBegan"))
    {
      BroadcastBeganParams localBroadcastBeganParams = (BroadcastBeganParams)paramINotification.getBody();
      TweetParams localTweetParams = new TweetParams(localBroadcastBeganParams.getTweetCompletion(), localBroadcastBeganParams.getShareText());
      getFacade().sendNotification("commandTweet", localTweetParams, null);
    }
  }

  public String[] listNotificationInterests()
  {
    return new String[] { "eventCommentAdded", "eventStreamLiked", "eventStreamRestreamed", "scheduledEventRestreamedCommand", "scheduledEventSubscribedCommand", "eventBroadcastBegan" };
  }
}