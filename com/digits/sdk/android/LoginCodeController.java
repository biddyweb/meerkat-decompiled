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

class LoginCodeController extends DigitsControllerImpl
{
  private final String phoneNumber;
  private final String requestId;
  private final long userId;

  LoginCodeController(ResultReceiver paramResultReceiver, StateButton paramStateButton, EditText paramEditText, SessionManager<DigitsSession> paramSessionManager, DigitsClient paramDigitsClient, String paramString1, long paramLong, String paramString2, ErrorCodes paramErrorCodes, ActivityClassManager paramActivityClassManager)
  {
    super(paramResultReceiver, paramStateButton, paramEditText, paramDigitsClient, paramErrorCodes, paramActivityClassManager, paramSessionManager);
    this.requestId = paramString1;
    this.userId = paramLong;
    this.phoneNumber = paramString2;
  }

  LoginCodeController(ResultReceiver paramResultReceiver, StateButton paramStateButton, EditText paramEditText, String paramString1, long paramLong, String paramString2)
  {
    this(paramResultReceiver, paramStateButton, paramEditText, Digits.getSessionManager(), Digits.getInstance().getDigitsClient(), paramString1, paramLong, paramString2, new ConfirmationErrorCodes(paramStateButton.getContext().getResources()), Digits.getInstance().getActivityClassManager());
  }

  private void startPinCodeActivity(Context paramContext)
  {
    Intent localIntent = new Intent(paramContext, this.activityClassManager.getPinCodeActivity());
    Bundle localBundle = getBundle(this.phoneNumber);
    localBundle.putParcelable("receiver", this.resultReceiver);
    localBundle.putString("request_id", this.requestId);
    localBundle.putLong("user_id", this.userId);
    localIntent.putExtras(localBundle);
    startActivityForResult((Activity)paramContext, localIntent);
  }

  public void executeRequest(final Context paramContext)
  {
    if (validateInput(this.editText.getText()))
    {
      this.sendButton.showProgress();
      CommonUtils.hideKeyboard(paramContext, this.editText);
      String str = this.editText.getText().toString();
      this.digitsClient.loginDevice(this.requestId, this.userId, str, new DigitsCallback(paramContext, this)
      {
        public void success(Result<DigitsSessionResponse> paramAnonymousResult)
        {
          if (((DigitsSessionResponse)paramAnonymousResult.data).isEmpty())
          {
            LoginCodeController.this.startPinCodeActivity(paramContext);
            return;
          }
          DigitsSession localDigitsSession = DigitsSession.create((DigitsSessionResponse)paramAnonymousResult.data);
          LoginCodeController.this.loginSuccess(paramContext, localDigitsSession, LoginCodeController.this.phoneNumber);
        }
      });
    }
  }

  Uri getTOSUri()
  {
    return DigitsConstants.TWITTER_TOS;
  }
}