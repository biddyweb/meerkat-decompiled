package co.getair.meerkat.mediators;

import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.support.v4.app.FragmentActivity;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.TextView;
import co.getair.meerkat.activities.PhoneActivationCodeActivity;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.utilities.ApplicationPreferences;
import com.google.i18n.phonenumbers.NumberParseException;
import com.google.i18n.phonenumbers.PhoneNumberUtil;
import com.google.i18n.phonenumbers.PhoneNumberUtil.PhoneNumberFormat;
import com.sithagi.countrycodepicker.CountryPicker;
import com.sithagi.countrycodepicker.CountryPickerListener;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.mediator.Mediator;

public class PhoneVerificationMediator extends Mediator
{
  private static final String NAME = "PhoneVerificationMediator";
  private Button continueButton;
  private TextView errorTextView;
  private View inputView;
  private EditText mobileNumberEditText;
  private Button openCountryPickerButton;
  private ProgressBar progressBar;
  private View rootView;
  private String selectedCountryCode;
  private String selectedCountryDialCode;

  public PhoneVerificationMediator(String paramString, Object paramObject)
  {
    super(paramString, paramObject);
    this.rootView = ((View)paramObject);
    this.inputView = this.rootView.findViewById(2131624100);
    this.progressBar = ((ProgressBar)this.rootView.findViewById(2131624105));
    this.openCountryPickerButton = ((Button)this.rootView.findViewById(2131624101));
    this.continueButton = ((Button)this.rootView.findViewById(2131624104));
    this.mobileNumberEditText = ((EditText)this.rootView.findViewById(2131624102));
    this.errorTextView = ((TextView)this.rootView.findViewById(2131624103));
    this.openCountryPickerButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        final CountryPicker localCountryPicker = CountryPicker.newInstance("Select Country");
        localCountryPicker.setListener(new CountryPickerListener()
        {
          public void onSelectCountry(String paramAnonymous2String1, String paramAnonymous2String2, String paramAnonymous2String3)
          {
            PhoneVerificationMediator.this.openCountryPickerButton.setText(String.format("%s ( %s )", new Object[] { paramAnonymous2String1, paramAnonymous2String3 }));
            PhoneVerificationMediator.access$102(PhoneVerificationMediator.this, paramAnonymous2String2);
            PhoneVerificationMediator.access$202(PhoneVerificationMediator.this, paramAnonymous2String3);
            localCountryPicker.dismiss();
          }
        });
        localCountryPicker.show(PhoneVerificationMediator.this.getOwnerActivity().getSupportFragmentManager(), "COUNTRY_PICKER");
      }
    });
    this.continueButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        String str1;
        if (PhoneVerificationMediator.this.selectedCountryDialCode != null)
        {
          try
          {
            PhoneNumberUtil localPhoneNumberUtil = PhoneNumberUtil.getInstance();
            new ApplicationPreferences(PhoneVerificationMediator.this.getOwnerActivity()).saveDefaultCountryCode(PhoneVerificationMediator.this.selectedCountryCode);
            String str2 = localPhoneNumberUtil.format(localPhoneNumberUtil.parse(PhoneVerificationMediator.this.selectedCountryDialCode + PhoneVerificationMediator.this.mobileNumberEditText.getText().toString(), null), PhoneNumberUtil.PhoneNumberFormat.E164);
            str1 = str2;
            if (str1 != null)
              break label124;
            PhoneVerificationMediator.this.promptInvalidNumberMessage();
            return;
          }
          catch (NumberParseException localNumberParseException)
          {
            while (true)
            {
              localNumberParseException.printStackTrace();
              str1 = null;
            }
          }
        }
        else
        {
          PhoneVerificationMediator.this.promptInvalidNumberMessage();
          return;
        }
        label124: ((InputMethodManager)PhoneVerificationMediator.this.getOwnerActivity().getSystemService("input_method")).hideSoftInputFromWindow(PhoneVerificationMediator.this.mobileNumberEditText.getWindowToken(), 0);
        PhoneVerificationMediator.this.inputView.setVisibility(8);
        PhoneVerificationMediator.this.progressBar.setVisibility(0);
        PhoneVerificationMediator.this.sendNotification("eventSendPhoneNumberForVerification", str1, null);
      }
    });
  }

  public static String getName()
  {
    return "PhoneVerificationMediator";
  }

  private FragmentActivity getOwnerActivity()
  {
    return (FragmentActivity)((BaseFacade)getFacade()).getOwnerActivity();
  }

  private void phoneNumberSent(String paramString)
  {
    Activity localActivity = ((BaseFacade)getFacade()).getOwnerActivity();
    Intent localIntent = new Intent(localActivity, PhoneActivationCodeActivity.class);
    localIntent.putExtra("phoneNumberBundleKey", paramString);
    localActivity.startActivity(localIntent);
    localActivity.finish();
  }

  private void promptInvalidNumberMessage()
  {
    new AlertDialog.Builder(((BaseFacade)getFacade()).getOwnerActivity()).setTitle("Invalid Phone Number").setMessage("Please double check that you have entered your number correctly.").setPositiveButton("Ok", new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
      }
    }).show();
  }

  private void showError()
  {
    this.inputView.setVisibility(0);
    this.progressBar.setVisibility(8);
    this.errorTextView.setVisibility(0);
  }

  public void handleNotification(INotification paramINotification)
  {
    if (paramINotification.getName().equals("eventSendPhoneNumberForVerificationFailed"))
      showError();
    if (paramINotification.getName().equals("eventPhoneNumberSentForVerification"))
      phoneNumberSent((String)paramINotification.getBody());
  }

  public String[] listNotificationInterests()
  {
    return new String[] { "eventSendPhoneNumberForVerificationFailed", "eventPhoneNumberSentForVerification" };
  }
}