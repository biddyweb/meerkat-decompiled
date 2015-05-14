package com.digits.sdk.android;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.ResultReceiver;
import android.widget.EditText;
import com.twitter.sdk.android.core.Result;
import com.twitter.sdk.android.core.SessionManager;
import io.fabric.sdk.android.services.common.CommonUtils;
import java.util.Locale;
import retrofit.client.Response;

class PhoneNumberController extends DigitsControllerImpl
{
  final CountryListSpinner countryCodeSpinner;
  String phoneNumber;

  PhoneNumberController(ResultReceiver paramResultReceiver, StateButton paramStateButton, EditText paramEditText, CountryListSpinner paramCountryListSpinner)
  {
    this(paramResultReceiver, paramStateButton, paramEditText, paramCountryListSpinner, Digits.getInstance().getDigitsClient(), new PhoneNumberErrorCodes(paramStateButton.getContext().getResources()), Digits.getInstance().getActivityClassManager(), Digits.getSessionManager());
  }

  PhoneNumberController(ResultReceiver paramResultReceiver, StateButton paramStateButton, EditText paramEditText, CountryListSpinner paramCountryListSpinner, DigitsClient paramDigitsClient, ErrorCodes paramErrorCodes, ActivityClassManager paramActivityClassManager, SessionManager paramSessionManager)
  {
    super(paramResultReceiver, paramStateButton, paramEditText, paramDigitsClient, paramErrorCodes, paramActivityClassManager, paramSessionManager);
    this.countryCodeSpinner = paramCountryListSpinner;
  }

  private Bundle getBundle()
  {
    Bundle localBundle = new Bundle();
    localBundle.putString("phone_number", this.phoneNumber);
    localBundle.putParcelable("receiver", this.resultReceiver);
    return localBundle;
  }

  private String getNumber(long paramLong, String paramString)
  {
    return "+" + String.valueOf(paramLong) + paramString;
  }

  private void startNextStep(Context paramContext)
  {
    Intent localIntent = new Intent(paramContext, this.activityClassManager.getConfirmationActivity());
    localIntent.putExtras(getBundle());
    startActivityForResult((Activity)paramContext, localIntent);
  }

  public void executeRequest(final Context paramContext)
  {
    if (validateInput(this.editText.getText()))
    {
      this.sendButton.showProgress();
      CommonUtils.hideKeyboard(paramContext, this.editText);
      int i = ((Integer)this.countryCodeSpinner.getTag()).intValue();
      String str = this.editText.getText().toString();
      this.phoneNumber = getNumber(i, str);
      this.digitsClient.registerDevice(paramContext, this, this.phoneNumber, new DigitsCallback(paramContext, this)
      {
        public void success(Result<Response> paramAnonymousResult)
        {
          PhoneNumberController.this.sendButton.showFinish();
          PhoneNumberController.this.editText.postDelayed(new Runnable()
          {
            public void run()
            {
              PhoneNumberController.this.startNextStep(PhoneNumberController.1.this.val$context);
            }
          }
          , 1500L);
        }
      });
    }
  }

  Uri getTOSUri()
  {
    return DigitsConstants.DIGITS_TOS;
  }

  public void handleError(final Context paramContext, DigitsException paramDigitsException)
  {
    if ((paramDigitsException instanceof AlreadyRegisteredException))
    {
      this.digitsClient.authDevice(this.phoneNumber, new DigitsCallback(paramContext, this)
      {
        public void success(Result<AuthResponse> paramAnonymousResult)
        {
          PhoneNumberController.this.sendButton.showFinish();
          PhoneNumberController.this.startSignIn(paramContext, ((AuthResponse)paramAnonymousResult.data).requestId, ((AuthResponse)paramAnonymousResult.data).userId);
        }
      });
      return;
    }
    super.handleError(paramContext, paramDigitsException);
  }

  public void setPhoneNumber(PhoneNumber paramPhoneNumber)
  {
    if (PhoneNumber.isValid(paramPhoneNumber))
    {
      this.editText.setText(paramPhoneNumber.getPhoneNumber());
      this.editText.setSelection(paramPhoneNumber.getPhoneNumber().length());
      this.countryCodeSpinner.setSelectedForCountry(new Locale("", paramPhoneNumber.getCountryIso()).getDisplayName(), paramPhoneNumber.getCountryCode());
    }
  }

  void startSignIn(Context paramContext, String paramString, long paramLong)
  {
    Intent localIntent = new Intent(paramContext, this.activityClassManager.getLoginCodeActivity());
    Bundle localBundle = getBundle();
    localBundle.putString("request_id", paramString);
    localBundle.putLong("user_id", paramLong);
    localIntent.putExtras(localBundle);
    startActivityForResult((Activity)paramContext, localIntent);
  }
}