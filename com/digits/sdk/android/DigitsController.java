package com.digits.sdk.android;

import android.content.Context;
import android.os.ResultReceiver;
import android.text.TextWatcher;

abstract interface DigitsController
{
  public abstract void clearError();

  public abstract void executeRequest(Context paramContext);

  public abstract int getErrorCount();

  public abstract ErrorCodes getErrors();

  public abstract TextWatcher getTextWatcher();

  public abstract void handleError(Context paramContext, DigitsException paramDigitsException);

  public abstract void onResume();

  public abstract void showTOS(Context paramContext);

  public abstract void startFallback(Context paramContext, ResultReceiver paramResultReceiver, DigitsException paramDigitsException);

  public abstract boolean validateInput(CharSequence paramCharSequence);
}