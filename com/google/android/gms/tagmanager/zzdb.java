package com.google.android.gms.tagmanager;

import android.content.Context;
import com.google.android.gms.analytics.GoogleAnalytics;
import com.google.android.gms.analytics.Logger;
import com.google.android.gms.analytics.Tracker;

class zzdb
{
  private Context mContext;
  private Tracker zzBL;
  private GoogleAnalytics zzBN;

  zzdb(Context paramContext)
  {
    this.mContext = paramContext;
  }

  private void zzdm(String paramString)
  {
    try
    {
      if (this.zzBN == null)
      {
        this.zzBN = GoogleAnalytics.getInstance(this.mContext);
        this.zzBN.setLogger(new zza());
        this.zzBL = this.zzBN.newTracker(paramString);
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public Tracker zzdl(String paramString)
  {
    zzdm(paramString);
    return this.zzBL;
  }

  static class zza
    implements Logger
  {
    private static int zzhj(int paramInt)
    {
      switch (paramInt)
      {
      case 6:
      default:
        return 3;
      case 5:
        return 2;
      case 3:
      case 4:
        return 1;
      case 2:
      }
      return 0;
    }

    public void error(Exception paramException)
    {
      zzbf.zzb("", paramException);
    }

    public void error(String paramString)
    {
      zzbf.zzZ(paramString);
    }

    public int getLogLevel()
    {
      return zzhj(zzbf.getLogLevel());
    }

    public void info(String paramString)
    {
      zzbf.zzaa(paramString);
    }

    public void setLogLevel(int paramInt)
    {
      zzbf.zzac("GA uses GTM logger. Please use TagManager.setLogLevel(int) instead.");
    }

    public void verbose(String paramString)
    {
      zzbf.zzab(paramString);
    }

    public void warn(String paramString)
    {
      zzbf.zzac(paramString);
    }
  }
}