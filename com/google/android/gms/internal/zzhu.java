package com.google.android.gms.internal;

import android.content.Context;
import android.text.TextUtils;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;

@zzgi
public final class zzhu extends zzhl
{
  private final Context mContext;
  private final String zznf;
  private final String zzxX;
  private String zzyW = null;

  public zzhu(Context paramContext, String paramString1, String paramString2)
  {
    this.mContext = paramContext;
    this.zznf = paramString1;
    this.zzxX = paramString2;
  }

  public zzhu(Context paramContext, String paramString1, String paramString2, String paramString3)
  {
    this.mContext = paramContext;
    this.zznf = paramString1;
    this.zzxX = paramString2;
    this.zzyW = paramString3;
  }

  public void onStop()
  {
  }

  public void zzdw()
  {
    try
    {
      zzhx.zzab("Pinging URL: " + this.zzxX);
      HttpURLConnection localHttpURLConnection = (HttpURLConnection)new URL(this.zzxX).openConnection();
      try
      {
        if (TextUtils.isEmpty(this.zzyW))
          zzab.zzaM().zza(this.mContext, this.zznf, true, localHttpURLConnection);
        while (true)
        {
          int i = localHttpURLConnection.getResponseCode();
          if ((i < 200) || (i >= 300))
            zzhx.zzac("Received non-success response code " + i + " from pinging URL: " + this.zzxX);
          return;
          zzab.zzaM().zza(this.mContext, this.zznf, true, localHttpURLConnection, this.zzyW);
        }
      }
      finally
      {
        localHttpURLConnection.disconnect();
      }
    }
    catch (IndexOutOfBoundsException localIndexOutOfBoundsException)
    {
      zzhx.zzac("Error while parsing ping URL: " + this.zzxX + ". " + localIndexOutOfBoundsException.getMessage());
      return;
    }
    catch (IOException localIOException)
    {
      zzhx.zzac("Error while pinging URL: " + this.zzxX + ". " + localIOException.getMessage());
    }
  }
}