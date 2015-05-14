package com.google.android.gms.internal;

import android.content.Context;
import android.content.Intent;
import android.os.Build.VERSION;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import com.google.android.gms.common.internal.zzx;
import java.util.ArrayList;
import java.util.concurrent.TimeUnit;

public class zzqf
{
  private static final String TAG = zzqf.class.getSimpleName();
  private static final long zzaoU = TimeUnit.SECONDS.toMillis(1L);
  private static zzqf zzaoV;
  private final Context mContext;
  private final Handler mHandler;
  private final Runnable zzaoW = new zza(null);
  private ArrayList<String> zzaoX = null;
  private ArrayList<String> zzaoY = null;
  private final Object zznh = new Object();

  private zzqf(Context paramContext)
  {
    this((Context)zzx.zzl(paramContext), new Handler(Looper.getMainLooper()));
  }

  zzqf(Context paramContext, Handler paramHandler)
  {
    this.mContext = paramContext;
    this.mHandler = paramHandler;
  }

  public static zzqf zzab(Context paramContext)
  {
    try
    {
      zzx.zzl(paramContext);
      int i = Build.VERSION.SDK_INT;
      if (i < 14);
      for (zzqf localzzqf = null; ; localzzqf = zzaoV)
      {
        return localzzqf;
        if (zzaoV == null)
          zzaoV = new zzqf(paramContext.getApplicationContext());
      }
    }
    finally
    {
    }
  }

  public void zzy(String paramString1, String paramString2)
  {
    synchronized (this.zznh)
    {
      if (this.zzaoX == null)
      {
        this.zzaoX = new ArrayList();
        this.zzaoY = new ArrayList();
        this.mHandler.postDelayed(this.zzaoW, zzaoU);
      }
      this.zzaoX.add(paramString1);
      this.zzaoY.add(paramString2);
      if (this.zzaoX.size() >= 10000)
      {
        if (Log.isLoggable(TAG, 5))
          Log.w(TAG, "Event buffer full, flushing");
        this.zzaoW.run();
        this.mHandler.removeCallbacks(this.zzaoW);
        return;
      }
      return;
    }
  }

  private class zza
    implements Runnable
  {
    private zza()
    {
    }

    public void run()
    {
      synchronized (zzqf.zzb(zzqf.this))
      {
        Intent localIntent = new Intent("com.google.android.location.places.METHOD_CALL");
        localIntent.setPackage("com.google.android.gms");
        localIntent.putStringArrayListExtra("PLACE_IDS", zzqf.zzc(zzqf.this));
        localIntent.putStringArrayListExtra("METHOD_NAMES", zzqf.zzd(zzqf.this));
        zzqf.zze(zzqf.this).sendBroadcast(localIntent);
        zzqf.zza(zzqf.this, null);
        zzqf.zzb(zzqf.this, null);
        return;
      }
    }
  }
}