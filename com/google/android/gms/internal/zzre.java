package com.google.android.gms.internal;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.os.Build.VERSION;
import android.text.TextUtils;
import android.util.Log;
import com.google.android.gms.common.internal.zzx;
import java.util.ArrayList;
import java.util.List;

public class zzre
{
  private static final zza[] zzash = new zza[0];
  private static zzre zzasi;
  private final Application zzasj;
  private zzrh zzask;
  private final List<zza> zzasl;
  private zzri zzasm;

  private zzre(Application paramApplication)
  {
    zzx.zzl(paramApplication);
    this.zzasj = paramApplication;
    this.zzasl = new ArrayList();
  }

  public static zzre zzag(Context paramContext)
  {
    zzx.zzl(paramContext);
    Application localApplication = (Application)paramContext.getApplicationContext();
    zzx.zzl(localApplication);
    try
    {
      if (zzasi == null)
        zzasi = new zzre(localApplication);
      zzre localzzre = zzasi;
      return localzzre;
    }
    finally
    {
    }
  }

  private zza[] zzqZ()
  {
    synchronized (this.zzasl)
    {
      if (this.zzasl.isEmpty())
      {
        zza[] arrayOfzza2 = zzash;
        return arrayOfzza2;
      }
      zza[] arrayOfzza1 = (zza[])this.zzasl.toArray(new zza[this.zzasl.size()]);
      return arrayOfzza1;
    }
  }

  public void zzZ(boolean paramBoolean)
  {
    if (Build.VERSION.SDK_INT < 14)
      Log.i("com.google.android.gms.measurement.ScreenViewService", "AutoScreeViewTracking is not supported on API 14 or earlier devices");
    while (zzqY() == paramBoolean)
      return;
    if (paramBoolean)
    {
      this.zzasm = new zzri(this);
      this.zzasj.registerActivityLifecycleCallbacks(this.zzasm);
      return;
    }
    this.zzasj.unregisterActivityLifecycleCallbacks(this.zzasm);
    this.zzasm = null;
  }

  public void zza(zza paramzza)
  {
    zzx.zzl(paramzza);
    synchronized (this.zzasl)
    {
      this.zzasl.remove(paramzza);
      this.zzasl.add(paramzza);
      return;
    }
  }

  public void zzb(zzrh paramzzrh, Activity paramActivity)
  {
    zzx.zzl(paramzzrh);
    boolean bool = paramzzrh.isMutable();
    Object localObject = null;
    zza[] arrayOfzza;
    if (bool)
    {
      if ((paramActivity instanceof zzrd))
        ((zzrd)paramActivity).zzb(paramzzrh);
      if (this.zzask != null)
      {
        paramzzrh.zzgr(this.zzask.zzaF());
        paramzzrh.zzcv(this.zzask.zzre());
      }
      arrayOfzza = zzqZ();
      for (int j = 0; j < arrayOfzza.length; j++)
        arrayOfzza[j].zza(paramzzrh, paramActivity);
      paramzzrh.zzrh();
      if (!TextUtils.isEmpty(paramzzrh.zzre()));
    }
    while (true)
    {
      return;
      localObject = arrayOfzza;
      if ((this.zzask != null) && (this.zzask.zzaF() == paramzzrh.zzaF()))
      {
        this.zzask = paramzzrh;
        return;
      }
      zzqX();
      this.zzask = paramzzrh;
      int i = 0;
      if (localObject == null)
        localObject = zzqZ();
      while (i < localObject.length)
      {
        localObject[i].zza(paramzzrh);
        i++;
      }
    }
  }

  public zzrh zzqW()
  {
    return this.zzask;
  }

  public void zzqX()
  {
    this.zzask = null;
  }

  public boolean zzqY()
  {
    return this.zzasm != null;
  }

  public static abstract interface zza
  {
    public abstract void zza(zzrh paramzzrh);

    public abstract void zza(zzrh paramzzrh, Activity paramActivity);
  }
}