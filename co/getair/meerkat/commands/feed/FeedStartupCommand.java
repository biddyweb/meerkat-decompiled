package co.getair.meerkat.commands.feed;

import android.app.Activity;
import co.getair.meerkat.ApiProxy;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.mediators.FeedMediator;
import co.getair.meerkat.notifications.RegisterForNotificationsCommand;
import co.getair.meerkat.notifications.RegisterForNotificationsParams;
import co.getair.meerkat.proxies.FeedProxy;
import co.getair.meerkat.proxies.SearchProxy;
import java.util.concurrent.Callable;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class FeedStartupCommand extends SimpleCommand
{
  private BaseFacade getBaseFacade()
  {
    return (BaseFacade)getFacade();
  }

  private void registerCommands()
  {
    Facade localFacade = getFacade();
    localFacade.registerCommand("feedGetLive", new GetLiveFeedCommand());
    localFacade.registerCommand("commandGoogleServicesApkAvailable", new RegisterForNotificationsCommand());
    localFacade.registerCommand("scheduledEventSubscribeCommand", new SubscribeToScheduledStreamCommand());
    localFacade.registerCommand("scheduledEventUnsubscribeCommand", new UnsubscribeFromScheduledStreamCommand());
    localFacade.registerCommand("searchForUserCommand", new SearchForUserCommand());
    localFacade.registerCommand("commandGoLive", new GoLiveCommand());
    localFacade.registerCommand("scheduledEventRestreamCommand", new RestreamScheduledStreamCommand());
    localFacade.registerCommand("scheduledEventUnrestreamCommand", new UnrestreamScheduledStreamCommand());
  }

  private void registerMediators()
  {
    FeedMediator localFeedMediator = new FeedMediator("feedMediator", getBaseFacade().getOwnerActivity().findViewById(2131624079));
    getFacade().registerMediator(localFeedMediator);
  }

  private void registerProxies()
  {
    Facade localFacade = getFacade();
    localFacade.registerProxy((FeedProxy)ApiProxy.getInstance(getBaseFacade().getOwnerActivity().getApplicationContext()).retrieveProxy("feedProxy", new Callable()
    {
      public Object call()
        throws Exception
      {
        return new FeedProxy("feedProxy", FeedStartupCommand.this.getBaseFacade().getOwnerActivity().getApplicationContext());
      }
    }));
    localFacade.registerProxy(new SearchProxy("searchProxy", getBaseFacade().getOwnerActivity().getApplicationContext()));
  }

  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    registerCommands();
    registerProxies();
    registerMediators();
    sendNotification("feedGetLive", new GetLiveParams(true), null);
    sendNotification("commandGoogleServicesApkAvailable", new RegisterForNotificationsParams(getBaseFacade().getOwnerActivity()));
  }
}