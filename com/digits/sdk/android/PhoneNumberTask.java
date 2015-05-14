package com.digits.sdk.android;

import io.fabric.sdk.android.services.concurrency.AsyncTask;

class PhoneNumberTask extends AsyncTask<Void, Void, PhoneNumber>
{
  private final PhoneNumberTask.Listener listener;
  private final PhoneNumberUtils phoneNumberUtils;

  protected PhoneNumberTask(PhoneNumberUtils paramPhoneNumberUtils, PhoneNumberTask.Listener paramListener)
  {
    if (paramPhoneNumberUtils == null)
      throw new NullPointerException("phoneNumberManager can't be null");
    this.listener = paramListener;
    this.phoneNumberUtils = paramPhoneNumberUtils;
  }

  protected PhoneNumber doInBackground(Void[] paramArrayOfVoid)
  {
    return this.phoneNumberUtils.getPhoneNumber();
  }

  protected void onPostExecute(PhoneNumber paramPhoneNumber)
  {
    if (this.listener != null)
      this.listener.onLoadComplete(paramPhoneNumber);
  }
}