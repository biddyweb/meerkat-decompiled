package com.digits.sdk.android;

import android.content.Context;
import com.twitter.sdk.android.core.Callback;
import com.twitter.sdk.android.core.TwitterException;
import io.fabric.sdk.android.Fabric;
import io.fabric.sdk.android.Logger;
import java.lang.ref.WeakReference;

public abstract class DigitsCallback<T> extends Callback<T>
{
  private final WeakReference<Context> context;
  final DigitsController controller;

  DigitsCallback(Context paramContext, DigitsController paramDigitsController)
  {
    this.context = new WeakReference(paramContext);
    this.controller = paramDigitsController;
  }

  public void failure(TwitterException paramTwitterException)
  {
    DigitsException localDigitsException = DigitsException.create(this.controller.getErrors(), paramTwitterException);
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("HTTP Error: ").append(paramTwitterException.getMessage()).append(", API Error: ").append(localDigitsException.getErrorCode()).append(", User Message: ").append(localDigitsException.getMessage());
    Fabric.getLogger().e("Digits", localStringBuilder.toString());
    this.controller.handleError((Context)this.context.get(), localDigitsException);
  }
}