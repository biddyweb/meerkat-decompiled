package co.getair.meerkat.commands.webview;

import android.app.Activity;
import android.content.Intent;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.mediators.WebViewMediator;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class WebViewStartupCommand extends SimpleCommand
{
  private BaseFacade getBaseFacade()
  {
    return (BaseFacade)getFacade();
  }

  private void registerCommands()
  {
    getFacade().registerCommand("webviewOpen", new WebViewOpenUrlCommand());
  }

  private void registerMediators()
  {
    WebViewMediator localWebViewMediator = new WebViewMediator("webviewMediator", getBaseFacade().getOwnerActivity().findViewById(2131624156));
    getFacade().registerMediator(localWebViewMediator);
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
    sendNotification("webviewOpen", getBaseFacade().getOwnerActivity().getIntent().getExtras(), null);
  }
}