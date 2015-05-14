package com.google.android.gms.internal;

import android.app.DownloadManager;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;

class zzed$1
  implements DialogInterface.OnClickListener
{
  zzed$1(zzed paramzzed, String paramString1, String paramString2)
  {
  }

  public void onClick(DialogInterface paramDialogInterface, int paramInt)
  {
    DownloadManager localDownloadManager = (DownloadManager)zzed.zza(this.zztz).getSystemService("download");
    try
    {
      localDownloadManager.enqueue(this.zztz.zzf(this.zztx, this.zzty));
      return;
    }
    catch (IllegalStateException localIllegalStateException)
    {
      this.zztz.zzH("Could not store picture.");
    }
  }
}