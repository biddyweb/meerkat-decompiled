package co.getair.meerkat.commands;

import android.app.Activity;
import co.getair.meerkat.activities.ScheduleBroadcastActivity;
import co.getair.meerkat.commands.schedule.ScheduleBroadcastCommand;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.mediators.ScheduleBroadcastMediator;
import co.getair.meerkat.proxies.ScheduleBroadcastProxy;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class ScheduleBroadcastStartupCommand extends SimpleCommand
{
  private BaseFacade getBaseFacade()
  {
    return (BaseFacade)getFacade();
  }

  private ScheduleBroadcastActivity getOwnerActivity()
  {
    return (ScheduleBroadcastActivity)getBaseFacade().getOwnerActivity();
  }

  private void registerCommands()
  {
    getFacade().registerCommand("scheduleBroadcastStartedScheduling", new ScheduleBroadcastCommand());
  }

  private void registerMediators()
  {
    ScheduleBroadcastMediator localScheduleBroadcastMediator = new ScheduleBroadcastMediator("scheduleBroadcastMediator", getBaseFacade().getOwnerActivity().findViewById(2131624117));
    getFacade().registerMediator(localScheduleBroadcastMediator);
  }

  private void registerProxies()
  {
    ScheduleBroadcastProxy localScheduleBroadcastProxy = new ScheduleBroadcastProxy("scheduleBroadcastProxy", (ScheduleBroadcastActivity)getBaseFacade().getOwnerActivity());
    getFacade().registerProxy(localScheduleBroadcastProxy);
  }

  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    registerCommands();
    registerProxies();
    registerMediators();
  }
}