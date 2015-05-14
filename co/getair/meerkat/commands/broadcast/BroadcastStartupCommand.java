package co.getair.meerkat.commands.broadcast;

import android.app.Activity;
import android.content.Intent;
import co.getair.meerkat.activities.BroadcastActivity;
import co.getair.meerkat.commands.watch.AddCommentCommand;
import co.getair.meerkat.dtos.GoLiveParams;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.mediators.BroadcastMediator;
import co.getair.meerkat.mediators.CommentsOnVideoMediator;
import co.getair.meerkat.proxies.BroadcastProxy;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class BroadcastStartupCommand extends SimpleCommand
{
  private BaseFacade getBaseFacade()
  {
    return (BaseFacade)getFacade();
  }

  private void registerCommands()
  {
    AddCommentCommand localAddCommentCommand = new AddCommentCommand();
    getFacade().registerCommand("eventAddComment", localAddCommentCommand);
    getFacade().registerCommand("end", new BroadcastEndCommand());
    getFacade().registerCommand("broadcastReceivedCoverImage", new BroadcastUploadCoverImage());
  }

  private void registerMediators()
  {
    CommentsOnVideoMediator localCommentsOnVideoMediator = new CommentsOnVideoMediator("commentsOnVideoMediator", getBaseFacade().getOwnerActivity().findViewById(2131624046));
    getFacade().registerMediator(localCommentsOnVideoMediator);
    BroadcastMediator localBroadcastMediator = new BroadcastMediator(getBaseFacade().getOwnerActivity().findViewById(2131624046));
    getFacade().registerMediator(localBroadcastMediator);
  }

  private void registerProxies()
  {
    BroadcastProxy localBroadcastProxy = new BroadcastProxy("broadcastProxy", (BroadcastActivity)getBaseFacade().getOwnerActivity());
    getFacade().registerProxy(localBroadcastProxy);
  }

  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    registerCommands();
    registerProxies();
    registerMediators();
    BroadcastActivity localBroadcastActivity = (BroadcastActivity)getBaseFacade().getOwnerActivity();
    ((BroadcastProxy)getFacade().retrieveProxy("broadcastProxy")).startGoLiveSequence(((GoLiveParams)localBroadcastActivity.getIntent().getParcelableExtra("goLiveParams")).getCaption());
  }
}