package co.getair.meerkat.mediators;

import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.os.Handler;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnFocusChangeListener;
import android.view.Window;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;
import co.getair.meerkat.activities.AddressbookUploadActivity;
import co.getair.meerkat.activities.PhoneActivationCodeActivity;
import co.getair.meerkat.dtos.ActivationCodeParams;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.utilities.MLog;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.mediator.Mediator;

public class PhoneActivationCodeMediator extends Mediator
{
  private static final String NAME = "PhoneActivationMediator";
  private static final int NUMBER_OF_DIGITS = 4;
  private EditText currentEditText;
  private EditText digitEditText1;
  private EditText digitEditText2;
  private EditText digitEditText3;
  private EditText digitEditText4;
  private View[] digits;
  private View.OnFocusChangeListener editTextFocusListener = new View.OnFocusChangeListener()
  {
    public void onFocusChange(View paramAnonymousView, boolean paramAnonymousBoolean)
    {
      if ((paramAnonymousBoolean) && (paramAnonymousView.getClass() == EditText.class))
      {
        PhoneActivationCodeMediator.access$002(PhoneActivationCodeMediator.this, (EditText)paramAnonymousView);
        PhoneActivationCodeMediator.this.markCurrentEditText();
      }
    }
  };
  private View inputView;
  private ImageView phoneImageView;
  private ProgressBar progressBar;
  private View resendSmsContainerView;
  private View rootView;
  private TextView secondsToResend;
  private TextView sendSmsToTextView;
  private TextWatcher textWatcher = new TextWatcher()
  {
    public void afterTextChanged(Editable paramAnonymousEditable)
    {
      if (PhoneActivationCodeMediator.this.currentEditText.getText().length() == 0);
      do
      {
        return;
        if (PhoneActivationCodeMediator.this.currentEditText == PhoneActivationCodeMediator.this.digitEditText1)
        {
          PhoneActivationCodeMediator.this.digitEditText2.requestFocus();
          return;
        }
        if (PhoneActivationCodeMediator.this.currentEditText == PhoneActivationCodeMediator.this.digitEditText2)
        {
          PhoneActivationCodeMediator.this.digitEditText3.requestFocus();
          return;
        }
        if (PhoneActivationCodeMediator.this.currentEditText == PhoneActivationCodeMediator.this.digitEditText3)
        {
          PhoneActivationCodeMediator.this.digitEditText4.requestFocus();
          return;
        }
      }
      while (PhoneActivationCodeMediator.this.currentEditText != PhoneActivationCodeMediator.this.digitEditText4);
      new Handler().postDelayed(new Runnable()
      {
        public void run()
        {
          PhoneActivationCodeMediator.this.submitActivationCode();
        }
      }
      , 750L);
    }

    public void beforeTextChanged(CharSequence paramAnonymousCharSequence, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3)
    {
    }

    public void onTextChanged(CharSequence paramAnonymousCharSequence, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3)
    {
    }
  };

  public PhoneActivationCodeMediator(String paramString, Object paramObject)
  {
    super(paramString, paramObject);
    this.rootView = ((View)paramObject);
    this.inputView = this.rootView.findViewById(2131624042);
    this.progressBar = ((ProgressBar)this.rootView.findViewById(2131624045));
    this.sendSmsToTextView = ((TextView)this.rootView.findViewById(2131624092));
    this.secondsToResend = ((TextView)this.rootView.findViewById(2131624098));
    this.resendSmsContainerView = this.rootView.findViewById(2131624097);
    this.digitEditText1 = ((EditText)this.rootView.findViewById(2131624093));
    this.digitEditText2 = ((EditText)this.rootView.findViewById(2131624094));
    this.digitEditText3 = ((EditText)this.rootView.findViewById(2131624095));
    this.digitEditText4 = ((EditText)this.rootView.findViewById(2131624096));
    this.digits = new View[4];
    this.digits[0] = this.digitEditText1;
    this.digits[1] = this.digitEditText2;
    this.digits[2] = this.digitEditText3;
    this.digits[3] = this.digitEditText4;
    this.resendSmsContainerView.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        MLog.d("AAAAAA", "RESEND SMS!");
      }
    });
    for (int i = 0; i < 4; i++)
    {
      this.digits[i].setOnFocusChangeListener(this.editTextFocusListener);
      ((EditText)this.digits[i]).addTextChangedListener(this.textWatcher);
    }
  }

  public static String getName()
  {
    return "PhoneActivationMediator";
  }

  private Activity getOwnerActivity()
  {
    return ((BaseFacade)getFacade()).getOwnerActivity();
  }

  private void markCurrentEditText()
  {
    if (this.currentEditText == null)
      return;
    for (int i = 0; i < 4; i++)
    {
      this.digits[i].setBackgroundResource(2130837993);
      ((EditText)this.digits[i]).addTextChangedListener(this.textWatcher);
    }
    this.currentEditText.setText(null);
    this.currentEditText.setBackgroundResource(2130837994);
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
  }

  private void submitActivationCode()
  {
    if (this.currentEditText == null)
      this.currentEditText = this.digitEditText4;
    ((InputMethodManager)getOwnerActivity().getSystemService("input_method")).hideSoftInputFromWindow(this.currentEditText.getWindowToken(), 0);
    StringBuffer localStringBuffer = new StringBuffer();
    for (int i = 0; i < 4; i++)
    {
      EditText localEditText = (EditText)this.digits[i];
      if (localEditText.getText().length() != 1)
        return;
      localStringBuffer.append(localEditText.getText().toString());
    }
    this.inputView.setVisibility(8);
    this.progressBar.setVisibility(0);
    this.digitEditText1.requestFocus();
    String str = localStringBuffer.toString();
    sendNotification("eventSendActivationCode", new ActivationCodeParams(((PhoneActivationCodeActivity)getOwnerActivity()).getPhoneNumber(), str), null);
  }

  public void activationCodeVerified()
  {
    Activity localActivity = ((BaseFacade)getFacade()).getOwnerActivity();
    localActivity.startActivity(new Intent(localActivity, AddressbookUploadActivity.class));
    localActivity.finish();
  }

  public void handleNotification(INotification paramINotification)
  {
    if (paramINotification.getName().equals("eventSendActivationCodeFail"))
      showError();
    if (paramINotification.getName().equals("eventSendActivationCodeAccepted"))
      activationCodeVerified();
  }

  public String[] listNotificationInterests()
  {
    return new String[] { "eventSendActivationCodeFail", "eventSendActivationCodeAccepted" };
  }

  public void onRegister()
  {
    super.onRegister();
    PhoneActivationCodeActivity localPhoneActivationCodeActivity = (PhoneActivationCodeActivity)getOwnerActivity();
    TextView localTextView = this.sendSmsToTextView;
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = localPhoneActivationCodeActivity.getPhoneNumber();
    localTextView.setText(localPhoneActivationCodeActivity.getString(2131296429, arrayOfObject));
    localPhoneActivationCodeActivity.getWindow().setSoftInputMode(4);
  }
}