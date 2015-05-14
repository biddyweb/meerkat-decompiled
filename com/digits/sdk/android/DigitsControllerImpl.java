package com.digits.sdk.android;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.ResultReceiver;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.widget.EditText;
import com.twitter.sdk.android.core.SessionManager;
import io.fabric.sdk.android.services.common.CommonUtils;

abstract class DigitsControllerImpl
  implements DigitsController, TextWatcher
{
  public static final int MAX_ERRORS = 5;
  static final long POST_DELAY_MS = 1500L;
  final ActivityClassManager activityClassManager;
  final DigitsClient digitsClient;
  final EditText editText;
  private int errorCount;
  final ErrorCodes errors;
  final ResultReceiver resultReceiver;
  final StateButton sendButton;
  final SessionManager<DigitsSession> sessionManager;

  DigitsControllerImpl(ResultReceiver paramResultReceiver, StateButton paramStateButton, EditText paramEditText, DigitsClient paramDigitsClient, ErrorCodes paramErrorCodes, ActivityClassManager paramActivityClassManager, SessionManager<DigitsSession> paramSessionManager)
  {
    this.resultReceiver = paramResultReceiver;
    this.digitsClient = paramDigitsClient;
    this.activityClassManager = paramActivityClassManager;
    this.sendButton = paramStateButton;
    this.editText = paramEditText;
    this.errors = paramErrorCodes;
    this.sessionManager = paramSessionManager;
    this.errorCount = 0;
  }

  private boolean isUnrecoverable(DigitsException paramDigitsException)
  {
    return (this.errorCount == 5) || ((paramDigitsException instanceof UnrecoverableException));
  }

  public void afterTextChanged(Editable paramEditable)
  {
  }

  public void beforeTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3)
  {
  }

  public void clearError()
  {
    this.editText.setError(null);
  }

  Bundle getBundle(String paramString)
  {
    Bundle localBundle = new Bundle();
    localBundle.putString("phone_number", paramString);
    return localBundle;
  }

  public int getErrorCount()
  {
    return this.errorCount;
  }

  public ErrorCodes getErrors()
  {
    return this.errors;
  }

  abstract Uri getTOSUri();

  public TextWatcher getTextWatcher()
  {
    return this;
  }

  public void handleError(Context paramContext, DigitsException paramDigitsException)
  {
    this.errorCount = (1 + this.errorCount);
    if (isUnrecoverable(paramDigitsException))
    {
      startFallback(paramContext, this.resultReceiver, paramDigitsException);
      return;
    }
    this.editText.setError(paramDigitsException.getLocalizedMessage());
    this.sendButton.showError();
  }

  void loginSuccess(final Context paramContext, DigitsSession paramDigitsSession, final String paramString)
  {
    this.sessionManager.setActiveSession(paramDigitsSession);
    this.sendButton.showFinish();
    this.editText.postDelayed(new Runnable()
    {
      public void run()
      {
        DigitsControllerImpl.this.resultReceiver.send(200, DigitsControllerImpl.this.getBundle(paramString));
        CommonUtils.finishAffinity((Activity)paramContext, 200);
      }
    }
    , 1500L);
  }

  public void onResume()
  {
    this.sendButton.showStart();
  }

  public void onTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3)
  {
    clearError();
  }

  public void showTOS(Context paramContext)
  {
    Intent localIntent = new Intent("android.intent.action.VIEW");
    localIntent.setData(getTOSUri());
    paramContext.startActivity(localIntent);
  }

  void startActivityForResult(Activity paramActivity, Intent paramIntent)
  {
    paramActivity.startActivityForResult(paramIntent, 140);
  }

  public void startFallback(Context paramContext, ResultReceiver paramResultReceiver, DigitsException paramDigitsException)
  {
    Intent localIntent = new Intent(paramContext, this.activityClassManager.getFailureActivity());
    localIntent.putExtra("receiver", paramResultReceiver);
    localIntent.putExtra("fallback_reason", paramDigitsException);
    paramContext.startActivity(localIntent);
    CommonUtils.finishAffinity(paramContext, 200);
  }

  public boolean validateInput(CharSequence paramCharSequence)
  {
    return !TextUtils.isEmpty(paramCharSequence);
  }
}