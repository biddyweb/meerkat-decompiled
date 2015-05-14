package com.google.android.gms.common.internal;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.support.v4.app.Fragment;
import android.util.Log;

public class zzg
  implements DialogInterface.OnClickListener
{
  private final Intent mIntent;
  private final Fragment zzPt;
  private final int zzPu;
  private final Activity zzoi;

  public zzg(Activity paramActivity, Intent paramIntent, int paramInt)
  {
    this.zzoi = paramActivity;
    this.zzPt = null;
    this.mIntent = paramIntent;
    this.zzPu = paramInt;
  }

  public zzg(Fragment paramFragment, Intent paramIntent, int paramInt)
  {
    this.zzoi = null;
    this.zzPt = paramFragment;
    this.mIntent = paramIntent;
    this.zzPu = paramInt;
  }

  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    try
    {
      if ((this.mIntent != null) && (this.zzPt != null))
        this.zzPt.startActivityForResult(this.mIntent, this.zzPu);
      while (true)
      {
        paramDialogInterface.dismiss();
        return;
        if (this.mIntent != null)
          this.zzoi.startActivityForResult(this.mIntent, this.zzPu);
      }
    }
    catch (ActivityNotFoundException localActivityNotFoundException)
    {
      Log.e("SettingsRedirect", "Can't redirect to app settings for Google Play services");
    }
  }
}