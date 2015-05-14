package com.digits.sdk.android;

import android.content.Context;
import android.net.Uri;
import android.os.ResultReceiver;
import android.widget.EditText;
import com.twitter.sdk.android.core.Result;
import com.twitter.sdk.android.core.SessionManager;
import io.fabric.sdk.android.services.common.CommonUtils;

class ConfirmationCodeController extends DigitsControllerImpl
{
  private final String phoneNumber;

  ConfirmationCodeController(ResultReceiver paramResultReceiver, StateButton paramStateButton, EditText paramEditText, String paramString)
  {
    this(paramResultReceiver, paramStateButton, paramEditText, paramString, Digits.getSessionManager(), Digits.getInstance().getDigitsClient(), new ConfirmationErrorCodes(paramStateButton.getContext().getResources()), Digits.getInstance().getActivityClassManager());
  }

  ConfirmationCodeController(ResultReceiver paramResultReceiver, StateButton paramStateButton, EditText paramEditText, String paramString, SessionManager<DigitsSession> paramSessionManager, DigitsClient paramDigitsClient, ErrorCodes paramErrorCodes, ActivityClassManager paramActivityClassManager)
  {
    super(paramResultReceiver, paramStateButton, paramEditText, paramDigitsClient, paramErrorCodes, paramActivityClassManager, paramSessionManager);
    this.phoneNumber = paramString;
  }

  public void executeRequest(final Context paramContext)
  {
    if (validateInput(this.editText.getText()))
    {
      this.sendButton.showProgress();
      CommonUtils.hideKeyboard(paramContext, this.editText);
      String str = this.editText.getText().toString();
      this.digitsClient.createAccount(str, this.phoneNumber, new DigitsCallback(paramContext, this)
      {
        public void success(Result<DigitsUser> paramAnonymousResult)
        {
          DigitsSession localDigitsSession = DigitsSession.create(paramAnonymousResult);
          ConfirmationCodeController.this.loginSuccess(paramContext, localDigitsSession, ConfirmationCodeController.this.phoneNumber);
        }
      });
    }
  }

  Uri getTOSUri()
  {
    return DigitsConstants.TWITTER_TOS;
  }
}