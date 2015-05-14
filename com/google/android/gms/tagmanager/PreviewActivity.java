package com.google.android.gms.tagmanager;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Bundle;

public class PreviewActivity extends Activity
{
  private void zzg(String paramString1, String paramString2, String paramString3)
  {
    AlertDialog localAlertDialog = new AlertDialog.Builder(this).create();
    localAlertDialog.setTitle(paramString1);
    localAlertDialog.setMessage(paramString2);
    localAlertDialog.setButton(-1, paramString3, new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
      }
    });
    localAlertDialog.show();
  }

  public void onCreate(Bundle paramBundle)
  {
    try
    {
      super.onCreate(paramBundle);
      zzbf.zzaa("Preview activity");
      Uri localUri = getIntent().getData();
      if (!TagManager.getInstance(this).zzl(localUri))
      {
        String str = "Cannot preview the app with the uri: " + localUri + ". Launching current version instead.";
        zzbf.zzac(str);
        zzg("Preview failure", str, "Continue");
      }
      Intent localIntent = getPackageManager().getLaunchIntentForPackage(getPackageName());
      if (localIntent != null)
      {
        zzbf.zzaa("Invoke the launch activity for package name: " + getPackageName());
        startActivity(localIntent);
        return;
      }
      zzbf.zzaa("No launch activity found for package name: " + getPackageName());
      return;
    }
    catch (Exception localException)
    {
      zzbf.zzZ("Calling preview threw an exception: " + localException.getMessage());
    }
  }
}