package com.instabug.wrapper.support.activity;

import android.os.Bundle;
import android.support.v7.app.ActionBarActivity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;

public class InstabugActionBarActivity extends ActionBarActivity
{
  private InstabugICSActivityDelegate mDelegate;

  public boolean dispatchTouchEvent(MotionEvent paramMotionEvent)
  {
    this.mDelegate.dispatchTouchEvent(paramMotionEvent);
    return super.dispatchTouchEvent(paramMotionEvent);
  }

  protected void onCreate(Bundle paramBundle)
  {
    this.mDelegate = new InstabugICSActivityDelegate(this);
    super.onCreate(paramBundle);
  }

  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    super.onCreateOptionsMenu(paramMenu);
    this.mDelegate.onCreateOptionsMenu(paramMenu);
    return true;
  }

  protected void onDestroy()
  {
    super.onDestroy();
    this.mDelegate.onDestroy();
  }

  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    if (this.mDelegate.onOptionsItemSelected(paramMenuItem))
      return true;
    return super.onOptionsItemSelected(paramMenuItem);
  }

  protected void onPause()
  {
    super.onPause();
    this.mDelegate.onPause();
  }

  protected void onResume()
  {
    super.onResume();
    this.mDelegate.onResume();
  }

  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    return super.onTouchEvent(paramMotionEvent);
  }
}