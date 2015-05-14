package com.instabug.wrapper.support.activity;

import android.app.Activity;
import android.content.res.Resources;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import com.instabug.library.Instabug;
import com.instabug.library.InstabugActivityDelegate;

class InstabugICSActivityDelegate extends InstabugActivityDelegate
{
  private final Activity mActivity;

  public InstabugICSActivityDelegate(Activity paramActivity)
  {
    super(paramActivity);
    this.mActivity = paramActivity;
  }

  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    if (Instabug.getInstance().isEnableOverflowMenuItem())
    {
      Resources localResources = this.mActivity.getResources();
      this.mActivity.getMenuInflater().inflate(localResources.getIdentifier("instabug_support_activity_menu", "menu", this.mActivity.getPackageName()), paramMenu);
      paramMenu.findItem(localResources.getIdentifier("invoke_instabug_menu_item", "id", this.mActivity.getPackageName())).setVisible(true);
    }
    return true;
  }

  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    if (paramMenuItem.getItemId() == this.mActivity.getResources().getIdentifier("invoke_instabug_menu_item", "id", this.mActivity.getPackageName()))
    {
      Instabug.getInstance().invoke();
      return true;
    }
    return false;
  }
}