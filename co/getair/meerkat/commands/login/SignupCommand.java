package co.getair.meerkat.commands.login;

import co.getair.meerkat.proxies.SessionProxy;
import co.getair.meerkat.utilities.MLog;
import com.twitter.sdk.android.core.models.User;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class SignupCommand extends SimpleCommand
{
  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    MLog.d("SignupCommand", "start");
    User localUser = (User)paramINotification.getBody();
    ((SessionProxy)getFacade().retrieveProxy("sessionProxy")).startSignUpFlow(localUser);
  }
}