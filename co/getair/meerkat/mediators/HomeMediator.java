package co.getair.meerkat.mediators;

import android.app.Activity;
import android.content.Intent;
import android.content.res.Resources;
import android.text.util.Linkify;
import android.text.util.Linkify.TransformFilter;
import android.view.View;
import android.widget.ProgressBar;
import android.widget.TextView;
import co.getair.meerkat.activities.PhoneVerificationActivity;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.views.LoginSuccessfulView;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.mediator.Mediator;

public class HomeMediator extends Mediator
{
  private TextView disclaimerTextView;
  private ProgressBar loginProgressBar;
  private LoginSuccessfulView loginSuccessfulView;

  public HomeMediator(String paramString, Object paramObject)
  {
    super(paramString, paramObject);
    View localView = (View)paramObject;
    this.loginSuccessfulView = ((LoginSuccessfulView)localView.findViewById(2131624088));
    this.loginProgressBar = ((ProgressBar)localView.findViewById(2131624089));
    this.disclaimerTextView = ((TextView)localView.findViewById(2131624086));
  }

  private void linkifyTermsOfUse()
  {
    String str1 = ((BaseFacade)getFacade()).getOwnerActivity().getResources().getString(2131296398);
    final HashMap localHashMap = new HashMap();
    localHashMap.put(str1, "www.meerkatapp.co");
    StringBuffer localStringBuffer = new StringBuffer();
    Iterator localIterator = localHashMap.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str2 = (String)localIterator.next();
      if (localStringBuffer.length() > 0)
        localStringBuffer.append("|");
      localStringBuffer.append(String.format("%s", new Object[] { str2 }));
    }
    Pattern localPattern = Pattern.compile(localStringBuffer.toString());
    Linkify.addLinks(this.disclaimerTextView, localPattern, "http://", null, new Linkify.TransformFilter()
    {
      public String transformUrl(Matcher paramAnonymousMatcher, String paramAnonymousString)
      {
        return (String)localHashMap.get(paramAnonymousString);
      }
    });
  }

  public void handleNotification(INotification paramINotification)
  {
    if (paramINotification.getName().equals("eventLoginSequenceStart"))
      this.loginProgressBar.setVisibility(0);
    if ((paramINotification.getName().equals("eventSessionInvalid")) || (paramINotification.getName().equals("eventTwitterLoginError")))
    {
      this.loginSuccessfulView.setVisibility(4);
      this.loginProgressBar.setVisibility(4);
    }
    if (paramINotification.getName().equals("eventSessionIsValid"))
    {
      this.loginSuccessfulView.setAlpha(0.0F);
      this.loginProgressBar.setVisibility(4);
    }
    if (paramINotification.getName().equals("eventAskForPhoneVerification"))
    {
      Activity localActivity = ((BaseFacade)getFacade()).getOwnerActivity();
      localActivity.startActivity(new Intent(localActivity, PhoneVerificationActivity.class));
    }
  }

  public String[] listNotificationInterests()
  {
    return new String[] { "eventLoginSequenceStart", "eventSessionInvalid", "eventSessionIsValid", "eventTwitterLoginError" };
  }

  public void onRegister()
  {
    super.onRegister();
    Resources localResources = ((BaseFacade)getFacade()).getOwnerActivity().getResources();
    String str = localResources.getString(2131296398);
    this.disclaimerTextView.setText(localResources.getString(2131296397, new Object[] { str }));
    linkifyTermsOfUse();
  }
}