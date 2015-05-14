package co.getair.meerkat.facades;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.IntentFilter;
import android.support.v4.content.LocalBroadcastManager;
import co.getair.meerkat.MeerkatApplication;
import co.getair.meerkat.commands.login.AuthorizeCommand;
import co.getair.meerkat.commands.mixpanel.DecrementPeolpePropertyCommand;
import co.getair.meerkat.commands.mixpanel.IdentifyOnMixpanelCommand;
import co.getair.meerkat.commands.mixpanel.IncrementMixpanelPeoplePropertyCommand;
import co.getair.meerkat.commands.mixpanel.SetMixpanelPeoplePropertiesCommand;
import co.getair.meerkat.commands.mixpanel.SetMixpanelSuperPropertiesCommand;
import co.getair.meerkat.commands.mixpanel.TimeEventCommand;
import co.getair.meerkat.commands.mixpanel.TrackEventCommand;
import co.getair.meerkat.commands.twitter.FavoriteTweetCommand;
import co.getair.meerkat.commands.twitter.OptInTweetsCommand;
import co.getair.meerkat.commands.twitter.OptOutTweetsCommand;
import co.getair.meerkat.commands.twitter.ReplyToTweetCommand;
import co.getair.meerkat.commands.twitter.RetweetTweetCommand;
import co.getair.meerkat.commands.twitter.TweetCommad;
import co.getair.meerkat.mediators.TwitterMediator;
import co.getair.meerkat.proxies.MixpanelProxy;
import co.getair.meerkat.proxies.TwitterProxy;
import co.getair.meerkat.utilities.GPSHandlerProxy;
import java.util.Map;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class BaseFacade extends Facade
{
  private BroadcastReceiver dismissBroadcast = new BaseFacade.1(this);
  private BroadcastReceiver dismissWatch = new BaseFacade.2(this);
  private Activity ownerActivity;

  protected BaseFacade(Activity paramActivity)
  {
    super(paramActivity.getClass().getName());
    setOwnerActivity(paramActivity);
  }

  public static BaseFacade getInst(Activity paramActivity)
  {
    String str = paramActivity.getClass().getName();
    if (instanceMap.get(str) == null)
      instanceMap.put(str, new BaseFacade(paramActivity));
    return (BaseFacade)instanceMap.get(str);
  }

  private void registerCommands()
  {
    super.initializeController();
    registerCommand("commandReplyToTweet", new ReplyToTweetCommand());
    registerCommand("commandFavoriteTweet", new FavoriteTweetCommand());
    registerCommand("commandRetweetTweet", new RetweetTweetCommand());
    registerCommand("commandOptInTweets", new OptInTweetsCommand());
    registerCommand("commandOptOutTweets", new OptOutTweetsCommand());
    registerCommand("commandTweet", new TweetCommad());
    registerCommand("identifyUserOnMixpanel", new IdentifyOnMixpanelCommand());
    registerCommand("trackMixpanelEvent", new TrackEventCommand());
    registerCommand("setMixpanelPeopleProperties", new SetMixpanelPeoplePropertiesCommand());
    registerCommand("seMixpanelSuperProperties", new SetMixpanelSuperPropertiesCommand());
    registerCommand("timeEventForMixpanel", new TimeEventCommand());
    registerCommand("incrementPeopleProperty", new IncrementMixpanelPeoplePropertyCommand());
    registerCommand("decrementPeopleProperty", new DecrementPeolpePropertyCommand());
    registerCommand("authorizationStart", new AuthorizeCommand());
  }

  private void registerMediators()
  {
    super.initializeView();
    registerMediator(new TwitterMediator());
  }

  private void registerProxies()
  {
    super.initializeModel();
    Activity localActivity = getOwnerActivity();
    MeerkatApplication localMeerkatApplication = (MeerkatApplication)localActivity.getApplication();
    registerProxy(new TwitterProxy("twitterProxy", localActivity));
    registerProxy(new MixpanelProxy("mixpanelProxy", localMeerkatApplication));
    registerProxy(new GPSHandlerProxy("gpsProxy", localActivity));
  }

  public Activity getOwnerActivity()
  {
    return this.ownerActivity;
  }

  public void setOwnerActivity(Activity paramActivity)
  {
    this.ownerActivity = paramActivity;
  }

  public void startup()
  {
    LocalBroadcastManager.getInstance(this.ownerActivity).registerReceiver(this.dismissBroadcast, new IntentFilter("notificationDismissBroadcastScreen"));
    LocalBroadcastManager.getInstance(this.ownerActivity).registerReceiver(this.dismissWatch, new IntentFilter("notificationDismissWatchScreen"));
    registerProxies();
    registerCommands();
    registerMediators();
    sendNotification("startup", this.ownerActivity, null);
  }
}