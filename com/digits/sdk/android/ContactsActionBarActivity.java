package com.digits.sdk.android;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.ActionBarActivity;

public class ContactsActionBarActivity extends ActionBarActivity
{
  ContactsActivityDelegateImpl delegate;

  public void onCreate(Bundle paramBundle)
  {
    setTheme(getIntent().getIntExtra("THEME_RESOURCE_ID", R.style.Theme_AppCompat_Light));
    super.onCreate(paramBundle);
    this.delegate = new ContactsActivityDelegateImpl(this);
    this.delegate.init();
  }
}