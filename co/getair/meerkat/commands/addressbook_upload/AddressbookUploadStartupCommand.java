package co.getair.meerkat.commands.addressbook_upload;

import android.app.Activity;
import co.getair.meerkat.commands.phone_verification.UploadContactsCommand;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.mediators.AddressbookUploadMediator;
import co.getair.meerkat.proxies.AddressbookUploadProxy;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class AddressbookUploadStartupCommand extends SimpleCommand
{
  private BaseFacade getBaseFacade()
  {
    return (BaseFacade)getFacade();
  }

  private void registerCommands()
  {
    getFacade().registerCommand("commandUploadContacts", new UploadContactsCommand());
  }

  private void registerMediators()
  {
    AddressbookUploadMediator localAddressbookUploadMediator = new AddressbookUploadMediator(AddressbookUploadMediator.getName(), getBaseFacade().getOwnerActivity().findViewById(2131624041));
    getFacade().registerMediator(localAddressbookUploadMediator);
  }

  private void registerProxies()
  {
    getFacade().registerProxy(new AddressbookUploadProxy(getBaseFacade().getOwnerActivity()));
  }

  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    registerCommands();
    registerProxies();
    registerMediators();
  }
}