package com.digits.sdk.android;

import android.content.Context;
import android.net.Uri;
import android.os.ResultReceiver;
import android.widget.EditText;
import com.twitter.sdk.android.core.Result;
import com.twitter.sdk.android.core.SessionManager;
import io.fabric.sdk.android.services.common.CommonUtils;

class PinCodeController extends DigitsControllerImpl
{
  private final String phoneNumber;
  private final String requestId;
  private final long userId;

  PinCodeController(ResultReceiver paramResultReceiver, StateButton paramStateButton, EditText paramEditText, SessionManager<DigitsSession> paramSessionManager, DigitsClient paramDigitsClient, String paramString1, long paramLong, String paramString2, ErrorCodes paramErrorCodes, ActivityClassManager paramActivityClassManager)
  {
    super(paramResultReceiver, paramStateButton, paramEditText, paramDigitsClient, paramErrorCodes, paramActivityClassManager, paramSessionManager);
    this.requestId = paramString1;
    this.userId = paramLong;
    this.phoneNumber = paramString2;
  }

  PinCodeController(ResultReceiver paramResultReceiver, StateButton paramStateButton, EditText paramEditText, String paramString1, long paramLong, String paramString2)
  {
    this(paramResultReceiver, paramStateButton, paramEditText, Digits.getSessionManager(), Digits.getInstance().getDigitsClient(), paramString1, paramLong, paramString2, new ConfirmationErrorCodes(paramStateButton.getContext().getResources()), Digits.getInstance().getActivityClassManager());
  }

  public void executeRequest(final Context paramContext)
  {
    if (validateInput(this.editText.getText()))
    {
      this.sendButton.showProgress();
      CommonUtils.hideKeyboard(paramContext, this.editText);
      String str = this.editText.getText().toString();
      this.digitsClient.verifyPin(this.requestId, this.userId, str, new DigitsCallback(paramContext, this)
      {
        public void success(Result<DigitsSessionResponse> paramAnonymousResult)
        {
          DigitsSession localDigitsSession = DigitsSession.create((DigitsSessionResponse)paramAnonymousResult.data);
          PinCodeController.this.loginSuccess(paramContext, localDigitsSession, PinCodeController.this.phoneNumber);
        }
      });
    }
  }

  Uri getTOSUri()
  {
    return null;
  }

  public void showTOS(Context paramContext)
  {
  }
}