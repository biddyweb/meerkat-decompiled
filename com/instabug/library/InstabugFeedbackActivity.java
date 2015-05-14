package com.instabug.library;

import android.app.Activity;
import android.os.Bundle;

public class InstabugFeedbackActivity extends Activity
{
  private b annotationScreen;

  public void onBackPressed()
  {
    this.annotationScreen.j();
    super.onBackPressed();
  }

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    requestWindowFeature(1);
    this.annotationScreen = new b(this);
    this.annotationScreen.a();
  }

  protected void onDestroy()
  {
    this.annotationScreen.b();
    super.onDestroy();
  }

  protected void onResume()
  {
    super.onResume();
    this.annotationScreen.i();
  }
}