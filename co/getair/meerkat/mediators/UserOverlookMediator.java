package co.getair.meerkat.mediators;

import co.getair.meerkat.FeatureFlag;
import co.getair.meerkat.dtos.Session;
import co.getair.meerkat.facades.BaseFacade;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.mediator.Mediator;

public class UserOverlookMediator extends Mediator
{
  private static final String NAME = "UserOverlookMediator";

  public UserOverlookMediator()
  {
    super("UserOverlookMediator", null);
  }

  public static String getName()
  {
    return "UserOverlookMediator";
  }

  private void proceedToNextStep()
  {
    Session localSession = Session.loadSession(((BaseFacade)getFacade()).getOwnerActivity());
    boolean bool1 = localSession.shouldProvidePhoneNumber();
    boolean bool2 = localSession.shouldAskForAddressBook();
    if ((bool1) && (FeatureFlag.isFeatureAvailable("phoneVerification").booleanValue()))
    {
      sendNotification("eventAskForPhoneVerification");
      return;
    }
    if ((bool2) && (FeatureFlag.isFeatureAvailable("phoneVerification").booleanValue()))
    {
      sendNotification("eventAskForAddressBookUpload");
      return;
    }
    sendNotification("eventUserOverlookFlowCompleted");
  }

  public void handleNotification(INotification paramINotification)
  {
    if ((paramINotification.getName().equals("eventStartUserOverlook")) || (paramINotification.getName().equals("eventDidCompleteStep")))
      proceedToNextStep();
  }

  public String[] listNotificationInterests()
  {
    return new String[] { "eventStartUserOverlook", "eventDidCompleteStep" };
  }
}