package com.digits.sdk.android;

import com.twitter.sdk.android.core.Callback;
import com.twitter.sdk.android.core.Result;
import com.twitter.sdk.android.core.TwitterException;

public abstract class ContactsCallback<T> extends Callback<T>
{
  public abstract void failure(TwitterException paramTwitterException);

  public abstract void success(Result<T> paramResult);
}