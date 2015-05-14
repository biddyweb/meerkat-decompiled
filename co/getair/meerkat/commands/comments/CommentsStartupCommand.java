package co.getair.meerkat.commands.comments;

import android.app.Activity;
import co.getair.meerkat.activities.CommentsActivity;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.mediators.CommentsMediator;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class CommentsStartupCommand extends SimpleCommand
{
  private BaseFacade getBaseFacade()
  {
    return (BaseFacade)getFacade();
  }

  private void registerCommands()
  {
    LoadCommentsListCommand localLoadCommentsListCommand = new LoadCommentsListCommand();
    getFacade().registerCommand("commentsLoad", localLoadCommentsListCommand);
  }

  private void registerMediators()
  {
    CommentsMediator localCommentsMediator = new CommentsMediator("commentsMediator", getBaseFacade().getOwnerActivity().findViewById(2131624074));
    getFacade().registerMediator(localCommentsMediator);
  }

  private void registerProxies()
  {
  }

  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    registerCommands();
    registerProxies();
    registerMediators();
    sendNotification("commentsLoad", ((CommentsActivity)getBaseFacade().getOwnerActivity()).getCommentsUrl(), null);
  }
}