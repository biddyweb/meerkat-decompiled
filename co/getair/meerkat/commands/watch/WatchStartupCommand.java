package co.getair.meerkat.commands.watch;

import android.app.Activity;
import co.getair.meerkat.ApiProxy;
import co.getair.meerkat.activities.WatchActivity;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.mediators.CommentsOnVideoMediator;
import co.getair.meerkat.mediators.WatchMediator;
import co.getair.meerkat.proxies.SessionProxy;
import co.getair.meerkat.proxies.TwitterProxy;
import co.getair.meerkat.proxies.WatchProxy;
import java.util.concurrent.Callable;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class WatchStartupCommand extends SimpleCommand
{
  public static final int OPEN_SESSION_FOR_WATCHER;

  private BaseFacade getBaseFacade()
  {
    return (BaseFacade)getFacade();
  }

  private void registerCommands()
  {
    WatcherEndCommand localWatcherEndCommand = new WatcherEndCommand();
    getFacade().registerCommand("end", localWatcherEndCommand);
    RestreamCommand localRestreamCommand = new RestreamCommand();
    getFacade().registerCommand("eventRestreamGotClicked", localRestreamCommand);
    LikeStreamCommand localLikeStreamCommand = new LikeStreamCommand();
    getFacade().registerCommand("eventLikeGotClicked", localLikeStreamCommand);
    ReportStreamCommand localReportStreamCommand = new ReportStreamCommand();
    getFacade().registerCommand("eventReportGotClicked", localReportStreamCommand);
    AddCommentCommand localAddCommentCommand = new AddCommentCommand();
    getFacade().registerCommand("eventAddComment", localAddCommentCommand);
  }

  private void registerMediators()
  {
    WatchMediator localWatchMediator = new WatchMediator("watchMediator", getBaseFacade().getOwnerActivity().findViewById(2131624128));
    getFacade().registerMediator(localWatchMediator);
    CommentsOnVideoMediator localCommentsOnVideoMediator = new CommentsOnVideoMediator("commentsOnVideoMediator", getBaseFacade().getOwnerActivity().findViewById(2131624128));
    getFacade().registerMediator(localCommentsOnVideoMediator);
  }

  private void registerProxies()
  {
    WatchActivity localWatchActivity = (WatchActivity)getBaseFacade().getOwnerActivity();
    SessionProxy localSessionProxy = (SessionProxy)ApiProxy.getInstance(getBaseFacade().getOwnerActivity().getApplicationContext()).retrieveProxy("sessionProxy", new Callable()
    {
      public Object call()
        throws Exception
      {
        return new SessionProxy("sessionProxy", WatchStartupCommand.this.getBaseFacade().getOwnerActivity().getApplicationContext());
      }
    });
    getFacade().registerProxy(localSessionProxy);
    WatchProxy localWatchProxy = new WatchProxy("watchProxy", localWatchActivity, localWatchActivity.streamId);
    getFacade().registerProxy(localWatchProxy);
  }

  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    registerCommands();
    registerProxies();
    registerMediators();
    ((TwitterProxy)getFacade().retrieveProxy("twitterProxy"));
    TwitterProxy.setCommentsShouldTweetState(Boolean.TRUE.booleanValue());
    ((WatchProxy)getFacade().retrieveProxy("watchProxy")).addMeAsWatcher();
  }
}