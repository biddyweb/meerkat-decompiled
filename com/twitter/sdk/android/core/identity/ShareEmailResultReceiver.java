package com.twitter.sdk.android.core.identity;

import android.os.Bundle;
import android.os.ResultReceiver;
import com.twitter.sdk.android.core.Callback;
import com.twitter.sdk.android.core.Result;
import com.twitter.sdk.android.core.TwitterException;

class ShareEmailResultReceiver extends ResultReceiver
{
  private final Callback<String> callback;

  public ShareEmailResultReceiver(Callback<String> paramCallback)
  {
    super(null);
    if (paramCallback == null)
      throw new IllegalArgumentException("Callback must not be null");
    this.callback = paramCallback;
  }

  public void onReceiveResult(int paramInt, Bundle paramBundle)
  {
    switch (paramInt)
    {
    default:
      throw new IllegalArgumentException("Invalid result code " + paramInt);
    case -1:
      this.callback.success(new Result(paramBundle.getString("email"), null));
      return;
    case 0:
      this.callback.failure(new TwitterException(paramBundle.getString("msg")));
      return;
    case 1:
    }
    this.callback.failure((TwitterException)paramBundle.getSerializable("error"));
  }
}