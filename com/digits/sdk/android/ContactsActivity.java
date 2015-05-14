package com.digits.sdk.android;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

public class ContactsActivity extends Activity
{
  ContactsActivityDelegateImpl delegate;

  public void onCreate(Bundle paramBundle)
  {
    setTheme(getIntent().getIntExtra("THEME_RESOURCE_ID", R.style.Digits_default));
    super.onCreate(paramBundle);
    this.delegate = new ContactsActivityDelegateImpl(this);
    this.delegate.init();
  }
}