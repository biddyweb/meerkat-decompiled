package co.getair.meerkat.mediators;

import android.app.Activity;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import co.getair.meerkat.facades.BaseFacade;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.mediator.Mediator;

public class AddressbookUploadMediator extends Mediator
{
  private static final String NAME = "AddressbookUploadMediator";
  private View rootView;
  private Button uploadContactsButton;

  public AddressbookUploadMediator(String paramString, Object paramObject)
  {
    super(paramString, paramObject);
    this.rootView = ((View)paramObject);
    this.uploadContactsButton = ((Button)this.rootView.findViewById(2131624044));
    this.uploadContactsButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        AddressbookUploadMediator.this.sendNotification("commandUploadContacts", AddressbookUploadMediator.this.getOwnerActivity());
      }
    });
  }

  public static String getName()
  {
    return "AddressbookUploadMediator";
  }

  private Activity getOwnerActivity()
  {
    return ((BaseFacade)getFacade()).getOwnerActivity();
  }

  public void handleNotification(INotification paramINotification)
  {
    if (paramINotification.getName().equals("eventSendActivationCodeFail"));
  }

  public String[] listNotificationInterests()
  {
    return new String[0];
  }
}